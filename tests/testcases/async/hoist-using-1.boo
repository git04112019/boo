"""
Pre
show
disposed
Post
result
"""

import System.Threading.Tasks
import System

class Program:
    class D(IDisposable):
        public def Dispose():
            print "disposed"

    [async] static def M(input as int) as Task[of string]:
        print "Pre"
        var window = D()
        try:
            print "show"
            for i in range(2):
                await Task.Delay(100)
        ensure:
            window.Dispose()
        print "Post"
        return "result"
    
static def Main():
    System.Console.WriteLine(Program.M(0).Result)
