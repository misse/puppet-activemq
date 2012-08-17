# Configure ActiveMQ to use Stomp connector
class activemq::stomp( $port = 61613 ){

  augeas { 'activemq-stomp':
    changes => [
      'set beans/broker/transportConnectors/transportConnector/#attribute/name stomp+nio',
      "set beans/broker/transportConnectors/transportConnector/#attribute/uri stomp+nio://0.0.0.0:${port}?transport.closeAsync=false",
    ],
    incl    => "${activemq::home}/activemq/conf/activemq.xml",
    lens    => 'Xml.lns',
    require => File["${activemq::home}/activemq"],
    notify  => Service['activemq'],
  }
}
