export default function TextInput({
    label,
    name,
    value,
    onChange,
    error,
    type = 'text',
    required = false,
}) {
    return (
        <div>
            <label className="block text-sm font-medium text-gray-700 mb-1">
                {label}
                {required && <span className="text-red-500 ml-1">*</span>}
            </label>
            <input
                type={type}
                name={name}
                value={value}
                onChange={onChange}
                className="border rounded px-3 py-2 w-full focus:outline-none focus:ring-2 focus:ring-blue-200"
            />
            {error && <div className="text-red-500 text-sm mt-1">{error}</div>}
        </div>
    );
}