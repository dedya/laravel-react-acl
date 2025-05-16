import React, { useRef } from 'react';
import { useForm, usePage, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
import { can } from '@/utils/can';

export default function Form({ user, roles, groups, auth }) {
  const isEdit = !!user;
  const { errors } = usePage().props;
  const photoInput = useRef();

  const { data, setData, post, put, processing } = useForm({
    name: user?.name || '',
    email: user?.email || '',
    password: '',
    role: user?.roles?.[0]?.name || '',
    user_group_id: user?.user_group_id || '',
    photo: null,
  });

  // Handle file change
  const handlePhotoChange = (e) => {
    setData('photo', e.target.files[0]);
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log(data); 
     isEdit
    ? put(route('users.update', user.id), { forceFormData: true })
    : post(route('users.store'), { forceFormData: true });
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
          <form onSubmit={handleSubmit} className="space-y-5" enctype="multipart/form-data">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Name</label>
              <input
                name="name" 
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
                name="email"
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
                name="password"
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
                value={data.password}
                onChange={e => setData('password', e.target.value)}
              />
              {errors.password && <div className="text-red-500 text-sm mt-1">{errors.password}</div>}
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Role</label>
              <select
                name="role"
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
                name="user_group_id"
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
                {user?.photo && (
                  <img
                    src={`/storage/${user.photo}`}
                    alt="Profile"
                    className="mt-2 h-32 w-32 object-cover rounded-full"
                  />
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
    </AuthenticatedLayout>
  );
}
