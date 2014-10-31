User.create(email: 'user1@example.com', password: 'password123', password_confirmation: 'password123')
Entry.create(title: 'user1\'s visible entry', content: 'yeah, visible entry', published: true, user: User.last)
Entry.create(title: 'user1\'s invisible entry', content: 'yeah, invisible entry', published: false, user: User.last)

User.create(email: 'user2@example.com', password: 'password123', password_confirmation: 'password123')
Entry.create(title: 'user2\'s visible entry', content: 'yeah, visible entry', published: true, user: User.last)
Entry.create(title: 'user2\'s invisible entry', content: 'yeah, invisible entry', published: false, user: User.last)

User.create(email: 'admin@example.com', password: 'password123', password_confirmation: 'password123', role: :admin)
