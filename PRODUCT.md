# Study Buddy

Find people to study with on your campus.

## Problem
Students struggle to find classmates to study with before exams. Study plans get lost in noisy group chats, and nobody knows who is coming.

## User
An undergraduate student preparing for an exam who wants to study with others in person.

## Core action
Join a study session.

## MVP screens
1. **Sign in** (`design/sign_in.png`)
   - Email and password. A toggle switches to "Create account", which adds a Name field.
   - Signed-out users only see this screen.
2. **Explore** (`design/home.png`, empty state `design/empty.png`)
   - Upcoming sessions, soonest first. Past sessions are hidden.
   - Each card: subject chip, title, date and time, location, seats taken ("3/6 joined").
   - "New session" button opens Create session. Tapping a card opens Session details.
   - States: loading, empty ("No study sessions yet" + "Create the first one"), error with "Try again".
3. **Session details** (`design/details.png`)
   - Subject, title, host name, date and time, location, seats taken with a progress bar, description.
   - Main button: "Join session", "Leave session" when joined, or a disabled "Full" when no seats are left.
4. **Create session** (`design/create.png`)
   - Title: required, 5 to 60 characters.
   - Subject: Calculus, Data Structures, Physics, Accounting, English, Other.
   - Date and time: required, must be in the future.
   - Location: required.
   - Seats: 2 to 20, default 6.
   - Description: optional.
   - The host is the signed-in user and counts as the first member.
5. **My sessions** (`design/my_sessions.png`)
   - Bottom navigation with two tabs: Explore and My sessions.
   - Two sections: "Hosting" (sessions I created) and "Joined" (sessions I joined but don't host).
   - Each section has its own empty state.

## Rules
- Only signed-in users can see or create sessions.
- Anyone signed in can join a session until it's full, and leave it at any time.
- Only the host can delete a session.

## Data
One Firestore collection, `sessions`:

| Field | Type |
| --- | --- |
| title | string |
| subject | string |
| description | string |
| location | string |
| startsAt | timestamp |
| capacity | number |
| hostId | string (user id) |
| hostName | string |
| members | array of user ids |
| createdAt | timestamp (server time) |

## Look
Material 3, Roboto, primary color #00696B, background #F4F8F7, white cards with rounded corners. Each subject has its own chip color. Full style sheet: `design/styles.png`.

## Later (not in the MVP)
Chat, maps, notifications, profile photos, editing a session, ratings.