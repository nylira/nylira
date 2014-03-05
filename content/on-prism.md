---
title: On PRISM
category: Privacy
date: 2013-06-11
---

I've created a site to help you opt of PRISM at [prism-break.org](https://prism-break.org). Below are interview questions I was asked by [Oscar Garcia](https://twitter.com/oskargarcia) from The Associated Press.

## In broad terms, why did you start prism-break.org? A Slate story you linked to on the site said "last week activists launched" the site — did you do this in collaboration with others or by yourself?

After The Guardian broke Edward Snowden's story about PRISM, I decided that I needed to free my data from the cloud. While it'll be impossible to confirm whether if Google or Dropbox actually removes my data from their servers, I can at least be proactive and limit future damage by moving away to self-hosted services. I started researching the various options, and found out that there was really no solid guide on how to transition away from proprietary web services. I purchased the prism-break.org domain when I realized that there are a lot of people in the same situation as I am.

Prism Break started as a text file on my computer. I launched the first version of the site over the course of several hours on June 10th. I initially posted prism-break.org on [Reddit's /r/technology subreddit](http://www.reddit.com/r/technology/comments/1g1sxa/how_to_opt_out_of_prism_the_nsas_global_data/), and the site been spreading entirely by word of mouth since then.

While I started Prism Break on my own, I have gotten lots of great feedback, edits, and translations over the last week from the community. I've been implementing the more mature and robust software suggestions onto the site. The codebase for the site is also open source, non-copyrighted, and publicly available on Github (https://github.com/nylira/prism-break). I'm very thankful to all those who've contributed thus far to the current state of Prism Break.

## What has the response been? I saw on Twitter that you passed 200K visits — have you seen other indicators of people changing their computing habits? 

The response has been far stronger than I had anticipated. I went to sleep after posting PRISM Break on Reddit, expecting upvotes in the double digits. I woke up to find PRISM Break one of the most popular submissions on the site, and an email from the Free Software Foundation inqiring about my future objectives with the site.

While I don't have indicators of people changing their computing habits, I do have PRISM Break anonymized record of outgoing clicks. It shows that GNU/Linux, Bitmessage, Tor Browser Bundle, DuckDuckGo, OwnCloud, and OpenStreetMap are among the most popular topics among visitors. I don't have any hard statistics past this point though. You'll have to get the download data from the software websites themselves. Based on many PRISM Break discussions I've read though, quite a number of people are switching out Google for DuckDuckGo or Startpage, and many of them considering switching their Operating System to GNU/Linux. It's a start. 

## Have you changed any of your own computing or other habits as a result of the NSA revelations? If so, what and why? 

I have switched my operating system from Apple OS X to Trisquel GNU/Linux. While Trisquel itself isn't particularly focused on security, the GNU/Linux open source ecosystem is much more conducive to privay and security. Apple's proprietary walled-garden means any number of tracking codes can be in your software without your knowledge.

I've also switched from Google Search -> Startpage, Google Chrome -> Firefox, Dropbox -> Git Annex Assistant, Google Talk to Adium (w/ OTR), Skype -> Jitsi, and Google Analytics -> Piwik. It's been a surprisingly easy change in every category so far.

## Do you think the knowledge of these spying programs are reframing the way people think about privacy and how they go about their business? A lot of people are talking about changing their habits — do you think people will actually do it? 

It's easier to talk to than to act. People are lazy, and online privacy is difficult right now. Most of us have grown so reliant on Google and Facebook that these applications become nearly impossible to replace. Even if you're not personally adverse to change, your company or social network may not feel the same way.

For most people, Facebook is going to be the most diffcult app to remove from their life. Facebook has a very strong networking effect. How will you ask your prospective employer to make a new account on your self-hosted social network? How about a new friend? There's no easy answer to this.

However, I'm hoping that people will realize that PRISM is no ordinary privacy breach. Those who understand that every word they type on Facebook or every word they say on Skype may be permanently recorded by the NSA will definitely look into encrypting their communication.


## Between chat, email encryption web browsing and currency, there are a lot of different bases to cover for people. Which do you think are the most important for people concerned about unwanted snooping? 

Communication is the most important part that needs to be encrypted. Unfortunately, email, even encrypted with GPG, is difficult to keep private. Your email provider has the metadata of your mail (who's sending to whom), and if your encryption key is breached even once, all your previous correspondence is compromised. I advise treating email as a public forum and using a messaging client with off-the-record (OTR) encryption for sensitive communication.

I advise visitors to research the options presented (and options unpresented) and come to their own conclusion as to which combination of software serves their needs best. There's no one all-encompassing solution for online privacy at the moment, but I'm sure teams around the world are working hard on implementing just that.

## How long did it take you to make the switches you described, from Apple OSX to Trisquel GNU/Linux and Google to Startpage, etc., all the way down the line? How many hours do you think you've put into this? 

It doesn't take long to make the switch to software. It's doable in a couple hours, depending on your internet connection speed. The time-consuming part is figuring software replacements that are free, polished, and unlikely to leak your information to third parties. This has taken me over a hundred hours so far, and this is the freely available information prism-break.org.

## Now that you've made these changes, how confident/comfortable are you about your privacy? Obviously it's got to be much better than before, but that's certainly different than feeling at ease or something close to it.

I'm feeling much more comfortable about my privacy after the switch. I definitely think my data is at least an order of magnitude safer than when I was using OS X and Chrome. Of course, I'll constantly be looking for easier and better ways to safeguard my privacy, and I'll update PRISM Break accordingly.

## In terms of Facebook and other social networks, do you think you'll use them less or change your approach to status updates and photos?

I've always been concerned about my online footprint. Even before PRISM became public knowledge, the vast amount of data a Google search could pull up on someone is startling, and incredibly difficult to remove. People should be careful of what they say in a public forum, because it will follow them for the rest of their lives. With the advent of Google Glass, even offline conversations may be forever etched in digital memory.

## Cheeky question: Did you by chance call the site Prism-break as a play on the Fox show "Prison Break"? How'd you come up with the name.

"PRISM Break" came up almost immediately as I brainstormed the various options for a domain name. I was really surprised it wasn't taken yet. Fox's show "Prison Break" is on my to-watch list, so that may have influenced it. 

## Last comments

Prism Break has only been in existence for a little over a week. It's a constant work in progress, and updates are pushed live every day. There are bound to be mistakes, but I'll do my best to fix them quickly. I advise not taking Prism Break as the authoritative resource on privacy, but as a starting point for further exploration into freedom and anonymity.

If you're interested in contributing, please do! The source files are available on [Github](https://github.com/nylira/prism-break).
