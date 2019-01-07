let Airtable = require("airtable")
Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: "keyzFu6nW20oiMPHP"
})
let base = Airtable.base("appXnxtto1FDKrDxS")

const state = []

const actions = {
  initializeEvents({ commit }) {
    base("events")
      .select()
      .firstPage((err, records) => {
        if (err) {
          return
        }
        records.forEach(record => {
          if (record.fields.active) commit("addEvent", record)
        })
      })
  }
}

const mutations = {
  addEvent(state, value) {
    state.push(value.fields)
  }
}

export default { state, actions, mutations }
