export function overrideConsole(container) {
  const log = document.querySelector(`${container}`)
  const form = document.createElement('form')
  const input = document.createElement('input')
  input.style.width = '100%'
  input.autofocus = true
  log.appendChild(form)
  form.appendChild(input)

  form.addEventListener('submit', function(event) {
    event.preventDefault();
    console.log(eval(input.value))
  })

  const verbs = ['log', 'warn', 'error']
  verbs.forEach(verb => {
    const real = console[verb].bind(console)
    console[verb] = function overrideConsole(...args) {
      real(...args)
      const msg = document.createElement('div')
      // msg.classList.add(verb)
      msg.textContent = verb + ': ' + args.join('\n')
      log.insertBefore(msg, form)
    }
  })
}