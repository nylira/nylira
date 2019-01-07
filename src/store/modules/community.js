let Airtable = require("airtable")
Airtable.configure({
  endpointUrl: "https://api.airtable.com",
  apiKey: "keyzFu6nW20oiMPHP"
})
let base = Airtable.base("app6cmf6dU89OHtUP")

let gatherRecords = function(commit, baseName, mutationName) {
  base(baseName)
    .select()
    .firstPage((err, records) => {
      if (err) {
        return
      }
      records.forEach(record => {
        if (record.fields.active) commit(mutationName, record)
      })
    })
}

const state = {
  articles: [],
  events: [],
  ecosystem: [],
  chat: [],
  content: []
}

const actions = {
  initCommunityArticles({ commit }) {
    gatherRecords(commit, "articles", "addCommunityArticle")
  },
  initCommunityEvents({ commit }) {
    gatherRecords(commit, "events", "addCommunityEvent")
  },
  initCommunityEcosystem({ commit }) {
    gatherRecords(commit, "ecosystem", "addCommunityEcosystem")
  },
  initCommunityChat({ commit }) {
    gatherRecords(commit, "chat", "addCommunityChat")
  },
  initCommunityContent({ commit }) {
    gatherRecords(commit, "content", "addCommunityContent")
  }
}

const mutations = {
  addCommunityArticle(state, value) {
    state.articles.push(value.fields)
  },
  addCommunityEvent(state, value) {
    state.events.push(value.fields)
  },
  addCommunityEcosystem(state, value) {
    state.ecosystem.push(value.fields)
  },
  addCommunityChat(state, value) {
    state.chat.push(value.fields)
  },
  addCommunityContent(state, value) {
    state.content.push(value.fields)
  }
}

export default { state, actions, mutations }
