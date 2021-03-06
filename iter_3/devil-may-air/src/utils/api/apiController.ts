import axios from 'axios';

const clientInfoCaching = (data) => {
  localStorage.setItem('user', JSON.stringify(data.user));
  localStorage.setItem('token', JSON.stringify(data.token));
}

const randomBalance = () => {
  // User will have at least 100 dollars in their pocket
  return Math.floor(Math.random() * 5000) + 100;
}

export function login(username, password) {
  axios.post('/auth/login', { username, password })
    .then(res => {
      const userData = res.data;
      clientInfoCaching(userData);
    }).catch(err => { throw new Error(err) })
}


export function register(form) {
  console.log(form)
  if (!form) throw new Error("No info found")
  const newUser = {
    name: form['name'].value,
    phone: form['phone'].value,
    email: form['email'].value,
    address: form['address'].value,
    cityCode: form['cityCode'].value,
    username: form['username'].value,
    password: form['password'].value,
    balance: randomBalance(),
    creditCard: form['creditCard'].value
  }
  axios.post('/user/register', newUser)
  .then(res => {
      const userData = res.data;
      clientInfoCaching(userData);
    }
  ).catch(err => { throw new Error(err) });

}
