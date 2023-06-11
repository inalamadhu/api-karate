function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseUrl : 'http://localhost:3030',
    products : '/products',
    PRODUCT_FEATURE : '/products.feature'
  };
  if (env == 'dev') {
    config.hostname = "5534arweewrewrewr";
    config.usernam="username";
  } else if (env == 'e2e') {
    // customize
  }

  karate.configure('connectTimeout', 10000);
  karate.configure('readTimeout', 10000);
  return config;
}