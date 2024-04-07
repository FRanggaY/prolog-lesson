% Copyright
% Family Tree
%male(samid).
%male(mukti).
%male(galih).
%male(francis).
%female(luna).
%female(maya).
%female(calista)

implement main
    open core

class predicates
    % predicate result function
    makeGreeting : (string Name) -> string Greeting.
    makeTitle : (string Title) -> string Title.

clauses
    % function for make greeting
    makeGreeting(Name) = Result :-
        string::format("Hello %!", Name) = Result.
        % function for make title
    makeTitle(Title) = Result :-
        Title = Result.

    run() :-
        console::init(), % Initial
        % call function
        DearGreeting = makeGreeting("Franciscus Rangga Yogianto"),
        console::write(DearGreeting),
        console::write("\n"),
        IntroTitle = makeTitle("Introduction Prolog"),
        console::write(IntroTitle),
        console::write("\n"),
        ExitTitle = makeTitle("Press any key to exit..."),
        console::write(ExitTitle).

end implement main

goal
    main::run().
