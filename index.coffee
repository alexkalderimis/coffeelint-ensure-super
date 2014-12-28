module.exports = class EnsureSuper

  rule:
    name: 'ensure_super'
    message: 'This method must call super'
    level: 'warn'
    description: 'Checks that subclasses call super in certain methods.'

  processClass: (ast, api, name) ->

  processAssignment: (ast, api) ->

  lintNode: (node, api) ->
    node.traverseChildren false, (child) =>
      switch child.constructor.name
        when 'Class' then @processClass child, api
        when 'Assign' then @processAssignment child, api
    return # Errors are listed in @errors.

  lintAST: (root, api) -> @lintNode root, api
