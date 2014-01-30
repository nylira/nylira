---
title: Common UX Problems
category: Interaction Design
date: 2014-01-30 14:20
---

UX problems and possible solutions.

## 1. Permanently deleting user data

Disk-space is cheap, and user whims are fickle. If you can absorb the extra costs, I suggest never permanently deleting anything a user creates, unless they cancel their account. Give your user a history page where they can restore the state of everything they've ever created or uploaded with your app. When they screw up (which they invariable will), they'll love you for thinking about the issue.

## 2. Minimize the use of modal dialogs -- allow for undo instead

Instead of rudely throwing a modal dialog in your user's face, consider using Gmail's method for atomic operations: soft delete. After every action, Gmail displays a nonintrusive status message at the top of the screen. The message tells the user exactly what's occured--e.g., "This conversation has been archived."--along with a simple "Undo" link.

Why is soft delete better than modal confirmation windows? For one, this method allows the user to delete faster by skipping a step (the modal middleman). Modal windows are intrusive, workflow-breaking, and force users user to make immediate decisions. Inline undos are far more user-friendly because the entire web app stays usable, instead of being backgrounded. Let's face it--most deleted files are never wanted back.

## 3. For power users, allow operating on multiple files

Native file managers allow clicking and dragging to lasso multiple documents. We've used this simple operation on our desktop for years, but it has yet to show up online. Select-lassos could work very well for photo-oriented apps.

## 4. Lightboxes break the usability of the web

Lightboxes break the UI conventions of the user's operating systems. The non-standard chrome tends to difficult to close and impossible to move. Solution: `<a href=image.jpg>` with a magnify icon. Let users decide if they want to open the image in a new window or not.
