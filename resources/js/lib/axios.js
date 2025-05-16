import axios from 'axios';

const axiosClient = axios.create({
  baseURL: '/api',
  headers: {
    'X-Requested-With': 'XMLHttpRequest',
  },
  withCredentials: true, // This ensures Sanctum auth cookies are sent
});

export default axiosClient;
