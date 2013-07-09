---
layout: post
title: uniq, a powerful built in method
date: 2013-07-08
categories: Rails helper methods
---
After picking up rails a little less than a month ago, I was impressed with the powerful helper method, 'uniq', ruby provides.  'uniq' removes duplicate values in an array.  Why is this so awesome?

{% highlight ruby %}
> array = ["b" , "a", "n", "a", "n", "a"]
 => ["b", "a", "n", "a", "n", "a"] 
> array.uniq
 => ["b", "a", "n"] 
{% endhighlight %}

If that does not impress you, think about how this would be accomplished without uniq's help.  How many lines of code would you have to write to remove duplicate values?

How would you do it in a lower level language like C++?  Ill walk you through the example code at [cplusplus.com][cplusplus]. 

1) include the stl::list library   
2) create a vector of your desired data type   
3) set the iterator based on the chosen data type, in this case, int.  
4) use the helper functions begin() and end() to feed unique its two required parameters  
5) resize the vector to truncate the found duplicates   
0) I forgot to mention that unique requires the vector be sorted first. Which this sample code illustrates.

{% highlight c++ %}
// unique algorithm example
#include <iostream>     // std::cout
#include <algorithm>    // std::unique, std::distance
#include <vector>       // std::vector

bool myfunction (int i, int j) {
  return (i==j);
}

int main () {
  int myints[] = {10,20,20,20,30,30,20,20,10};           // 10 20 20 20 30 30 20 20 10
  std::vector<int> myvector (myints,myints+9);

  // using default comparison:
  std::vector<int>::iterator it;
  it = std::unique (myvector.begin(), myvector.end());   // 10 20 30 20 10 ?  ?  ?  ?
                                                         //                ^

  myvector.resize( std::distance(myvector.begin(),it) ); // 10 20 30 20 10

  // using predicate comparison:
  std::unique (myvector.begin(), myvector.end(), myfunction);   // (no changes)

  // print out content:
  std::cout << "myvector contains:";
  for (it=myvector.begin(); it!=myvector.end(); ++it)
    std::cout << ' ' << *it;
  std::cout << '\n';

  return 0;
}

cplusplus.com
{% endhighlight %}

You can also pick through [stack overflow][stackoverflow] to see other people's homebrew solutions.   
Some of you are saying, "Wait! If ruby and c++ were on the food pyramid they wouldn't be in the same group! Why compare?"  This is not a direct comparision of languages, and I am not picking on C++.  I am simply pointing out the <i>power</i> of ruby and why I appreciate it. 


1) we did not have to declare a data type  
2) our list did not have to be ordered or orderable  
3) no includes!  
4) no manual truncation!

Rails takes the convienient methods of ruby and incorporates them for use with ActiveRecord::Base objects allowing the developer to move on to more impressing lines of code.
  
[cplusplus]: http://www.cplusplus.com/reference/algorithm/unique/
[stackoverflow]: http://stackoverflow.com/questions/4877504/how-can-i-remove-duplicate-values-from-a-list-in-c