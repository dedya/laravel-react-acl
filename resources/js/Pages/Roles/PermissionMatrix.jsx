import React from 'react';
import { useForm, usePage, Link } from '@inertiajs/react';
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function PermissionMatrix({ auth, role, permissions }) {
    // Define the actions and pages you want to show
    const actions = ['create', 'read', 'update', 'delete'];
    const pages = Array.from(
    new Set(
        permissions
        .map(p => p.name.split('-')[1])
        .filter(Boolean)
    )
    );

    const isEdit = !!role;
    const { errors, flash } = usePage().props;
    const { data, setData, post, put, processing } = useForm({
        name: role?.name || '',
        permissions: role?.permissions?.map(p => p.name) || [],
    });

    // Helper to check if permission exists in DB
    const permissionExists = (action, page) =>
        permissions.some(p => p.name === `${action}-${page}`);

    // Get all permission names for visible matrix
    const allMatrixPermissions = permissions
        .filter(p => actions.includes(p.name.split('-')[0]) && pages.includes(p.name.split('-')[1]))
        .map(p => p.name);

    // Get all permission names for a column (action)
    const getColumnPermissions = (action) =>
        permissions
            .filter(p => p.name.startsWith(action + '-') && pages.includes(p.name.split('-')[1]))
            .map(p => p.name);

    // Check if all permissions are checked
    const isAllChecked = allMatrixPermissions.length > 0 && allMatrixPermissions.every(p => data.permissions.includes(p));

    // Check if all permissions in a column are checked
    const isColumnChecked = (action) => {
        const colPerms = getColumnPermissions(action);
        return colPerms.length > 0 && colPerms.every(p => data.permissions.includes(p));
    };

    // Handle check all
    const handleCheckAll = (checked) => {
        if (checked) {
            setData('permissions', Array.from(new Set([...data.permissions, ...allMatrixPermissions])));
        } else {
            setData('permissions', data.permissions.filter(p => !allMatrixPermissions.includes(p)));
        }
    };

    // Handle check column
    const handleCheckColumn = (action, checked) => {
        const colPerms = getColumnPermissions(action);
        if (checked) {
            setData('permissions', Array.from(new Set([...data.permissions, ...colPerms])));
        } else {
            setData('permissions', data.permissions.filter(p => !colPerms.includes(p)));
        }
    };

    const handlePermissionChange = (permName) => {
        setData('permissions', data.permissions.includes(permName)
        ? data.permissions.filter(p => p !== permName)
        : [...data.permissions, permName]
        );
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        if (isEdit) {
            put(route('roles.update', role.id), { preserveScroll: true });
        } else {
            post(route('roles.store'), { preserveScroll: true });
        }
    };

return (
    <AuthenticatedLayout
        user={auth?.user}
        header={<h2 className="font-semibold text-xl text-gray-800 leading-tight">
                {isEdit ? 'Edit Role' : 'Create Role'}
            </h2>}
    >
        <Head title={isEdit ? 'Edit Role' : 'Create Role'} />
        
        <div className="max-w-2xl mx-auto py-8">
            <div className="bg-white rounded shadow p-6">
                {flash?.success && (
                    <div className="bg-green-100 border border-green-400 text-green-700 px-4 py-2 rounded mb-4">
                        {flash.success}
                    </div>
                )}
                <form onSubmit={handleSubmit} className="space-y-6">
                    <div>
                        <label className="block text-sm font-medium text-gray-700 mb-1">Role Name</label>
                        <input
                            className="border rounded px-3 py-2 w-full"
                            value={data.name}
                            onChange={e => setData('name', e.target.value)}
                            disabled={isEdit}
                            readOnly={isEdit}
                        />
                        {errors.name && (
                         <div className="text-red-500 text-sm mt-1">{errors.name}</div>
                        )}
                    </div>
                    <div>
                        <label className="block text-sm font-medium text-gray-700 mb-2">Permissions</label>
                        <div className="overflow-x-auto">
                            <table className="min-w-full border">
                                <thead>
                                    <tr>
                                        <th className="px-3 py-2 border text-center bg-gray-50">
                                            <input
                                                type="checkbox"
                                                checked={isAllChecked}
                                                onChange={e => handleCheckAll(e.target.checked)}
                                            /> &nbsp;Check All
                                        </th>
                                        {actions.map(action => (
                                            <th key={action + '-check'} className="px-3 py-2 border text-center bg-gray-50">
                                                <input
                                                    type="checkbox"
                                                    checked={isColumnChecked(action)}
                                                    onChange={e => handleCheckColumn(action, e.target.checked)}
                                                />
                                            </th>
                                        ))}
                                    </tr>

                                    <tr>
                                        <th className="px-3 py-2 border text-center">Page</th>
                                        {actions.map(action => (
                                            <th key={action} className="px-3 py-2 border text-center capitalize">{action}</th>
                                        ))}
                                    </tr>
                                     
                                </thead>
                                <tbody>
                                    {pages.map(page => (
                                        <tr key={page}>
                                            <td className="px-3 py-2 border text-center capitalize">{page}</td>
                                            {actions.map(action => {
                                                const permName = `${action}-${page}`;
                                                return (
                                                    <td key={action} className="px-3 py-2 border text-center">
                                                        {permissionExists(action, page) ? (
                                                            <input
                                                                type="checkbox"
                                                                checked={data.permissions.includes(permName)}
                                                                onChange={() => handlePermissionChange(permName)}
                                                            />
                                                        ) : null}
                                                    </td>
                                                );
                                            })}
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                        {errors.permissions && <div className="text-red-500 text-sm mt-1">{errors.permissions}</div>}
                    </div>
                    <div className="flex items-center gap-4 mt-6">
                        <Link href={route('roles.index')} className="text-gray-600 hover:underline">
                            Cancel
                        </Link>
                        
                        <button
                            type="submit"
                            disabled={processing}
                            className="bg-green-600 hover:bg-green-700 text-white px-6 py-2 rounded shadow disabled:opacity-50"
                        >
                            {isEdit ? 'Update' : 'Create'}
                        </button>
                        
                    </div>
                </form>
            </div>
        </div>
    </AuthenticatedLayout>
);
}