import React from 'react';
import { Link, usePage, router } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';
// Import SweetAlert2
import Swal from 'sweetalert2';
import 'sweetalert2/dist/sweetalert2.min.css';
import { FaEdit, FaTrashAlt } from 'react-icons/fa'; // Add this line

export default function RoleIndex({ auth }) {
  const { roles, flash, labels } = usePage().props;

    // Handler for delete confirmation using SweetAlert2
    const handleDelete = (e, roleId, roleName) => {
      e.preventDefault();
      Swal.fire({
        title: labels?.delete_confirm_title || 'Are you sure?',
        text: labels?.delete_confirm_text || 'This role will be deleted permanently!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: labels?.delete_confirm_yes || 'Yes, delete it!',
        reverseButtons: true,
      }).then((result) => {
        if (result.isConfirmed) {
          if (result.isConfirmed) {
              router.delete(route('roles.destroy', roleId),{
                onSuccess: () => {
                Swal.fire({
                  toast: true,
                  position: 'top-end',
                  icon: 'success',
                  title:
                    (labels?.delete_success
                    ? labels.delete_success.replace(':name', roleName)
                    : `Role "${roleName}" is deleted successfully!`),
                  showConfirmButton: false,
                  timer: 2000,
                  timerProgressBar: true,
                  background: '#d1fae5',
                  color: '#166534',
                });
              },
            });
          }
        }
      });
    };

  return (
    <AuthenticatedLayout
      user={auth?.user}
      header={
        <h2 className="font-semibold text-xl text-gray-800 leading-tight">
          Role List
        </h2>
      }
    >
      <Head title="Roles" />

      <div className="max-w-4xl mx-auto py-8">
        {flash?.success && (
          <div className="bg-green-100 border border-green-400 text-green-700 px-4 py-2 rounded mb-4">
            {flash.success}
          </div>
        )}

        <div className="flex justify-between items-center mb-4">
          <h3 className="text-lg font-bold text-gray-700">Roles</h3>
          <Link
            href={route('roles.create')}
            className="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow"
          >
            + Add Role
          </Link>
        </div>

        <div className="overflow-x-auto bg-white rounded shadow">
          <table className="min-w-full divide-y divide-gray-200">
            <thead className="bg-gray-50">
              <tr>
                <th className="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
                <th className="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                <th className="px-4 py-2 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
              </tr>
            </thead>
            <tbody className="bg-white divide-y divide-gray-100">
              {roles.length === 0 && (
                <tr>
                  <td colSpan={3} className="px-4 py-4 text-center text-gray-400">
                    No roles found.
                  </td>
                </tr>
              )}
              {roles.map(role => (
                <tr key={role.id}>
                  <td className="px-4 py-2">{role.id}</td>
                  <td className="px-4 py-2">{role.name}</td>
                  <td className="px-4 py-2 space-x-2">
                    <Link
                      title="Edit"
                      href={route('roles.edit', role.id)}
                      className="inline-block text-blue-600 hover:underline"
                    >
                    <FaEdit size={18} />                    
                    </Link>
                    <button
                        title="Delete"
                        type="button"
                        onClick={e => handleDelete(e, role.id, role.name)}
                        className="inline-block text-red-600 hover:underline bg-transparent border-0 p-0 m-0 cursor-pointer"
                    >
                      <FaTrashAlt size={18} />
                    </button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </AuthenticatedLayout>
  );
}