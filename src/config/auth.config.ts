const authConfig = () => ({
  jwt: {
    secret: process.env.JWT_SECRET || "default-secret",
    expiresIn: process.env.JWT_EXPIRES_IN || "1h",
    username: process.env.AUTH_USERNAME || "username",
    password: process.env.AUTH_PASSWORD || "password",
  },
});
export default authConfig;
