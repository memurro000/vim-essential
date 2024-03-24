import os
import os.path as p

PATH_TO_LOMBOK = p.join( '/home/prikolshik/.m2/repository/org/projectlombok/lombok/1.18.30/lombok-1.18.30.jar' )


def Settings( **kwargs ):
  if not os.path.exists( PATH_TO_LOMBOK ):
    raise RuntimeError( "No lombok jar located at " + PATH_TO_LOMBOK )

  jvm_args = [
    '-noverify',
    '-Xmx1G',
    '-XX:+UseG1GC',
    '-XX:+UseStringDeduplication',
  ]

  return {
    'server': {
      'jvm_args': [ '-javaagent:' + PATH_TO_LOMBOK ] + jvm_args
    }
  }
