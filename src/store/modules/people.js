let Airtable = require("airtable")
Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: "keyzFu6nW20oiMPHP"
})
let base = Airtable.base("appciBpErOMIpSV0l")

const state = []

const actions = {
  initializePeople({ commit }) {
    base("people")
      .select()
      .firstPage((err, records) => {
        if (err) {
          return
        }
        records.forEach(record => {
          if (record.fields.active) commit("addPerson", record)
        })
      })
  }
}

const mutations = {
  addPerson(state, value) {
    state.push(value.fields)
  }
}

export default { state, actions, mutations }
