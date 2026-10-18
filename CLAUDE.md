# Commit messages and PR descriptions

Write for a reviewer who hasn't read the code:

1. Start with the problem as a user or reviewer sees it, with the background needed to
   follow it (what the system normally does, what went wrong, a concrete example).
2. Then say what the change does in one or two sentences, describing behaviour, not internals.
3. Then list the consequences grouped by kind (**Fixed**, **Behaviour changes**, risks or
   new dependencies), each with its reason.
4. Use plain words. Define any term a reviewer wouldn't know; leave out implementation
   details (handler names, call paths) unless the reviewer needs them to judge the change.
5. Put issue references last.
