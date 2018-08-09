class UsersQuery
  attr_accessor :relation

  def initialize(relation = User.all)
    @relation = relation
  end

  def with_post_count
    relation.left_outer_joins(:posts)
                         .group('users.id')
                         .select('users.*')
                         .select('COUNT(posts.id) AS post_count')
  end
end
