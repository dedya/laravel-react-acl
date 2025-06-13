import React, { useRef, useEffect,useState } from 'react';
import { useForm, usePage, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { can } from '@/utils/can';

import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import { swalConfirmDeleteDefaults } from '@/utils/swalDefaults';

export default function Form({ user, roles, groups, auth }) {
  const isEdit = !!user;
  const { errors, alertTimer, general} = usePage().props;
  const photoInput = useRef();
  const [removePhoto, setRemovePhoto] = useState(false);
  const [photoPreview, setPhotoPreview] = useState(null);

  useEffect(() => {
    // Check if there are any errors
    if (Object.keys(errors).length > 0) {
       Object.values(errors).forEach((msg) => {
        toast.error(msg, {
          position: "top-right",
          autoClose: alertTimer || 4000, // or use a prop/config value
          hideProgressBar: false,
          closeOnClick: true,
          pauseOnHover: true,
          draggable: true,
          progress: undefined,
          theme: "colored",
        });
      });
    }
  }, [user, errors]);

  const { data, setData, post, put, processing } = useForm({
    name: user?.name || '',
    email: user?.email || '',
    password: '',
    role: user?.roles?.[0]?.name || '',
    user_group_id: user?.user_group_id || '',
    photo: null,
    _method:isEdit?'PUT':'POST',
    remove_photo: false,
  });

  // Handle file change
  const handlePhotoChange = (e) => {
      const file = e.target.files[0];
      setData('photo', file);
      setRemovePhoto(true);
      setData('remove_photo', true);

      if (file) {
        setPhotoPreview(URL.createObjectURL(file));
      } else {
        setPhotoPreview(null);
      }
    };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(data); 
     isEdit
    ? post(route('users.update', user.id),{forceFormData:true})
    : post(route('users.store'),{forceFormData:true});
  };

  return (
    <AuthenticatedLayout
      user={auth?.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          {isEdit ? general.edit_user : general.create_user}
        </h2>
      }
    >
      <Head title={isEdit ? general.edit_user : general.create_user} />
      <div className="max-w-xl mx-auto py-8">
        <div className="bg-white rounded shadow p-6">
          <form onSubmit={handleSubmit} className="space-y-5" encType="multipart/form-data">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {general?.name}
                <span className="text-red-500 ml-1">*</span>
              </label>
              <input
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.name}
                onChange={e => setData('name', e.target.value)}
              />
              {errors.name && <div className="text-red-500 text-sm mt-1">{errors.name}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {general?.email}
                <span className="text-red-500 ml-1">*</span>
              </label>
              <input
                type="email"
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.email}
                onChange={e => setData('email', e.target.value)}
              />
              {errors.email && <div className="text-red-500 text-sm mt-1">{errors.email}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {general?.password} {isEdit ? <span className="text-xs text-gray-400">({general?.leave_blank})</span> : ''}
                {!isEdit && <span className="text-red-500 ml-1">*</span>}
              </label>
              <input
                type="password"
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.password}
                onChange={e => setData('password', e.target.value)}
              />
              {errors.password && <div className="text-red-500 text-sm mt-1">{errors.password}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {general?.role}
                <span className="text-red-500 ml-1">*</span>
              </label>
              <select
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.role}
                onChange={(e) => setData('role', e.target.value)}
              >
                <option value=""></option>
                {roles.map((role) => (
                  <option key={role.name} value={role.name}>
                    {role.name}
                  </option>
                ))}
              </select>
              {errors.role && <div className="text-red-500 text-sm mt-1">{errors.role}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">
                {general.profile_image}
              </label>
                <input
                  type="file"
                  accept="image/*"
                  ref={photoInput}
                  onChange={handlePhotoChange}
                  className="border rounded px-3 py-2 w-full"
                />
                
                {(photoPreview || (user?.photo && !removePhoto)) && (
                  <div className="mt-2 relative inline-block">
                    <img
                      src={photoPreview ? photoPreview : `/storage/${user.photo}`}
                      alt="Preview"
                      className="h-32 w-32 object-cover rounded-full"
                    />
                    {
                      (can('update-user') || can('create-user')) &&

                      <button
                        type="button"
                        className="absolute top-0 right-0 m-1 p-1 bg-red-500 text-white rounded-full hover:bg-red-600 flex items-center justify-center opacity-70 hover:opacity-100"
                        title="Remove photo"
                        style={{ transform: 'translate(50%,-50%)' }}
                        onClick={async () => {
                          const result = await Swal.fire({
                            title: general?.delete_confirm_title,
                            text: general?.delete_image_confirm_text,
                            icon: 'warning',
                            confirmButtonText: general?.delete_confirm_yes || 'Yes, delete it!',
                            cancelButtonText: general?.cancel,
                            toast: false,
                            ...swalConfirmDeleteDefaults,                            
                          });
                          if (result.isConfirmed) {
                            setRemovePhoto(true);
                            setData('photo', null);
                            setData('remove_photo', true);
                            setPhotoPreview(null);
                            if (photoInput.current) photoInput.current.value = '';
                            Swal.fire({
                              toast: true,
                              position: 'top-end',
                              icon: 'success',
                              title: general?.image_will_removed_after_save,
                              showConfirmButton: false,
                              timer: 2000,
                              background: '#f0fdf4',
                              color: '#166534',
                            });
                          }
                        }}
                      >
                        <svg xmlns="http://www.w3.org/2000/svg" className="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                        </svg>
                      </button>
                    }
                  </div>
                )}

                {removePhoto && !photoPreview && (
                  <div className="text-sm text-gray-500 mt-2">{general?.image_will_removed_after_save}</div>
                )}
                {errors.photo && <div className="text-red-500 text-sm mt-1">{errors.photo}</div>}
              </div>


            <div className="flex items-center gap-4 mt-6">
              <Link
                href={route('users.index')}
                className="text-gray-600 hover:underline"
              >
                {general?.cancel}
              </Link>              
              {
                (can('update-user') || can('create-user')) &&
                <button
                  type="submit"
                  disabled={processing}
                  className="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded shadow disabled:opacity-50"
                >
                  {general?.submit}
                </button>
              }

              
            </div>
          </form>
        </div>
      </div>
        <ToastContainer />
    </AuthenticatedLayout>
  );
}
