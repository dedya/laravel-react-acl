import React from 'react';
import { useForm, usePage, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function RoleForm({ auth, role = null, permissions = [] }) {
  const { errors } = usePage().props;
  const isEdit = !!role;

  const { data, setData, post, put, processing } = useForm({
    name: role?.name || '',
    permissions: role?.permissions?.map(p => p.name) || [],
  });

  const handleSubmit = (e) => {
    e.preventDefault();
    isEdit
      ? put(route('roles.update', role.id), { preserveScroll: true })
      : post(route('roles.store'), { preserveScroll: true });
  };

  const handlePermissionChange = (permissionName) => {
    setData('permissions', data.permissions.includes(permissionName)
      ? data.permissions.filter(p => p !== permissionName)
      : [...data.permissions, permissionName]
    );
  };

  return (
    <AuthenticatedLayout
      user={auth?.user}
      header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">{isEdit ? 'Edit Role' : 'Create Role'}</h2>}
    >
      <Head title={isEdit ? 'Edit Role' : 'Create Role'} />
      <div className="max-w-2xl mx-auto py-8">
        <div className="bg-white rounded shadow p-6">
          <form onSubmit={handleSubmit} className="space-y-6">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-1">Role Name</label>
              <input
                className="border rounded px-3 py-2 w-full"
                value={data.name}
                onChange={e => setData('name', e.target.value)}
              />
              {errors.name && <div className="text-red-500 text-sm mt-1">{errors.name}</div>}
            </div>
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Permissions</label>
              <div className="overflow-x-auto">
                <table className="min-w-full border">
                  <thead>
                    <tr>
                      {permissions.map(permission => (
                        <th key={permission.id} className="px-3 py-2 text-xs font-semibold text-gray-600 border text-center">
                          {permission.name}
                        </th>
                      ))}
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      {permissions.map(permission => (
                        <td key={permission.id} className="px-3 py-2 border text-center">
                          <input
                            type="checkbox"
                            checked={data.permissions.includes(permission.name)}
                            onChange={() => handlePermissionChange(permission.name)}
                          />
                        </td>
                      ))}
                    </tr>
                  </tbody>
                </table>
              </div>
              {errors.permissions && <div className="text-red-500 text-sm mt-1">{errors.permissions}</div>}
            </div>
            <div className="flex items-center gap-4 mt-6">
              <button
                type="submit"
                disabled={processing}
                className="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded shadow disabled:opacity-50"
              >
                {isEdit ? 'Update' : 'Create'}
              </button>
              <Link href={route('roles.index')} className="text-gray-600 hover:underline">
                Cancel
              </Link>
            </div>
          </form>
        </div>
      </div>
    </AuthenticatedLayout>
  );
}