define mozart::cat_split_file($split_file=$title, $install_dir, $owner, $group, $creates) {

  # create the install directory
  file { "$install_dir":
    ensure  => directory,
    owner   => $user,
    group   => $group,
    mode    => 0755,
  }

  # cat the split file parts
  exec { "cat $split_file.*":
    creates => "$install_dir/$split_file",
    path    => ["/bin", "/usr/bin"],
    command => "cat /etc/puppet/modules/mozart/files/$split_file.* > $install_dir/$split_file",
  }
}
