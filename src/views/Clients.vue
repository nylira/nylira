<template lang="pug">
extends layouts/base

block title
  | Clients

block container

  section.section-top
    .section-header
      h2 Clients

    .section-content
      .article-body
        :markdown
          ** This is a select list of my clients since 2010.** Take a look at how my work has evolved over the years.

      - for client in clients
        a.block-client(href=depth + client.slug + '/')
          if client.meta.slug
            .thumb: img(src='../assets/images/clients/'+client.meta.slug+'-thumb.png')
          .text
            .title!= client.meta.title
            .sub: .date= moment(client.meta.date).format("YYYY-MM-DD")
</template>
