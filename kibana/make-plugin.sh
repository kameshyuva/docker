version=${1?' need argument [ version ]'}
# For kibana version < 5 , plugin file can be directly imported using "bin/kibana plugin -i"
if [ $version -gt 2 ]; then
   unzip /health_metric_vis-master.zip
   cd /health_metric_vis-master
   make PREFIX=/ version

   cd /kibana/bin
   ./kibana-plugin install file:///health_metric_vis-master/health_metric_vis-${TAG}.zip
   rm -f /health_metric_vis-master.zip /kibana_metric_vis_colors-master.zip
fi

if [ $version -le 2 ]; then
   cd /kibana/bin
   ./kibana plugin --install metric-vis-colors --url file:///kibana_metric_vis_colors-master.zip
   rm -f /kibana_metric_vis_colors-master.zip /health_metric_vis-master.zip
fi

# stupid hack to handle test condition status for version < 2
exit 0
