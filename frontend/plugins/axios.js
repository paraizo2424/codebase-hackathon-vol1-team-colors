export default function ({ $axios }) {
  $axios.onRequest((config) => {
    config.headers.client = window.localStorage.getItem('client')
    config.headers['access-token'] = window.localStorage.getItem('access-token')
    config.headers.uid = window.localStorage.getItem('uid')
    config.headers['token-type'] = window.localStorage.getItem('token-type')
  })

  $axios.onResponse((res) => {
    if (res.headers.client) {
      localStorage.setItem('access-token', res.headers['access-token'])
      localStorage.setItem('client', res.headers.client)
      localStorage.setItem('uid', res.headers.uid)
      localStorage.setItem('token-type', res.headers['token-type'])
    }
  })
}
