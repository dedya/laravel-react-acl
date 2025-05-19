import React, { useRef, useEffect,useState } from 'react';
import { useForm, usePage, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { can } from '@/utils/can';

import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';

export default function Form({ user, roles, groups, auth }) {
  const isEdit = !!user;
  const { errors, alertTimer } = usePage().props;
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
          {isEdit ? 'Edit User' : 'Create User'}
        </h2>
      }
    >
      <Head title={isEdit ? 'Edit User' : 'Create User'} />
      <div className="max-w-xl mx-auto py-8">
        <div className="bg-white rounded shadow p-6">
          <form onSubmit={handleSubmit} className="space-y-5" encType="multipart/form-data">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
              <input
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.name}
                onChange={e => setData('name', e.target.value)}
              />
              {errors.name && <div className="text-red-500 text-sm mt-1">{errors.name}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Email</label>
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
                Password {isEdit ? <span className="text-xs text-gray-400">(leave blank to keep current)</span> : ''}
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
              <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
              <select
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.role}
                onChange={(e) => setData('role', e.target.value)}
              >
                <option value="">Select Role</option>
                {roles.map((role) => (
                  <option key={role.name} value={role.name}>
                    {role.name}
                  </option>
                ))}
              </select>
              {errors.role && <div className="text-red-500 text-sm mt-1">{errors.role}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Group</label>
              <select
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.user_group_id}
                onChange={(e) => setData('user_group_id', e.target.value)}
              >
                <option value="">Select Group</option>
                {groups.map((group) => (
                  <option key={group.id} value={group.id}>
                    {group.name}
                  </option>
                ))}
              </select>
              {errors.user_group_id && <div className="text-red-500 text-sm mt-1">{errors.user_group_id}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Profile Photo</label>
                <input
                  type="file"
                  accept="image/*"
                  ref={photoInput}
                  onChange={handlePhotoChange}
                  className="border rounded px-3 py-2 w-full"
                />
                
                {photoPreview ? (
                  <div className="mt-2 flex items-center gap-2">
                    <img
                      src={photoPreview}
                      alt="Preview"
                      className="h-32 w-32 object-cover rounded-full"
                    />
                    <button
                      type="button"
                      className="ml-2 px-3 py-1 bg-red-500 text-white rounded"
                      onClick={() => {
                        setRemovePhoto(true);
                        setData('photo', null);
                        setData('remove_photo', true);
                        setPhotoPreview(null);
                        if (photoInput.current) photoInput.current.value = '';
                      }}
                    >
                      Remove
                    </button>
                  </div>
                ) : user?.photo && !removePhoto ? (
                  <div className="mt-2 flex items-center gap-2">
                    <img
                      src={`/storage/${user.photo}`}
                      alt="Profile"
                      className="h-32 w-32 object-cover rounded-full"
                    />
                    <button
                      type="button"
                      className="ml-2 px-3 py-1 bg-red-500 text-white rounded"
                      onClick={() => {
                        setRemovePhoto(true);
                        setData('photo', null);
                        setData('remove_photo', true);
                        setPhotoPreview(null);
                        if (photoInput.current) photoInput.current.value = '';
                      }}
                    >
                      Remove
                    </button>
                  </div>
                ) : null}
                {removePhoto && !photoPreview && (
                  <div className="text-sm text-gray-500 mt-2">Image will be removed after saving.</div>
                )}
                {errors.photo && <div className="text-red-500 text-sm mt-1">{errors.photo}</div>}
              </div>


            <div className="flex items-center gap-4 mt-6">
              <Link
                href={route('users.index')}
                className="text-gray-600 hover:underline"
              >
                Cancel
              </Link>
              
              {can('update-user') &&  
                <button
                  type="submit"
                  disabled={processing}
                  className="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded shadow disabled:opacity-50"
                >
                  {isEdit ? 'Update' : 'Create'}
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
