
# OM|PROFILER

Haxe method profiler forked from: http://hamaluik.com/posts/creating-a-code-profiler-in-haxe-using-macros/

## Usage

Add build meta to the class you want to profile:
```haxe
@:build(om.MethodProfiler.profile(true))
class App { .. }
```

For sub classes:
```haxe
@:autoBuild(om.MethodProfiler.profile(true))
class App { .. }
```

Print results:
```haxe
MethodProfiler.print()
```

By default all methods get profiled.
Set `@noProfile` on methods you want to blacklist; Or pass false as argument to MethodProfiler.profile and whitelist methods using `@profile`.
