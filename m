Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378187;
	b=Dm5Rha/bQuyUC4ChjkTUqSMHJb0IeRrdePnMK+7MGQ0/yPZBM001RO93sphoZ1achNuj
	 JASRqEbhrIKT6UkuqkY+JJkpiX+6U8cWZJFwgB8v2EWmhRQRwoc/nevH02M/0lbKVXxzi
	 OCXeUSpj8YV5/ZsO4xPWR0ov4bZikkQV5hma19/slU8VVMe6Sp0dD0dGeQXgaf9zJ1qfu
	 GpdLd15ykZenRFV0soK1ToWDNyELYUIFMYUpvjUn6FSSZpI/Meg5eBr9yG9tJXKyWArV8
	 jNlaJk+NxN5ikGbT7JddtqVIf/AZrmBGNVenuilUdRST/anNNJ4qI9AIWEPrygWrawQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378187;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
	b=DqerFMRXX8WcbsdXIJpbcP8hFdImsXeI0n5q9iJwkwEbEfGhePEDUkDjafkV0jQMkx4Q
	 yy6HgLzBpptFPOsWpKDZ3lr0rK8N47AfMDXUci4QqBmZJZ+HdG0wjaJcezk4J7rLsDjqr
	 zynGfNJwyzUR1zh776pLyGQPBS4fF2t9krf1LfhEb8o/4ajeYiGQKIp+O2ktrtaAaSCJg
	 zyB68n3DRoodc6nTTl6wXghknHdc61l7QlGNurAEzsBOITJfWxVf5FFWwWmbUU5YUQ6hF
	 YKsw1WQhTqKxJiFThNd7Tm0DZS3oZ1L/Lh94SoL3J33MW+aSwNseBqheKT4kiDeJv7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VgqAV8J0;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA365606A331
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA365606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VgqAV8J0
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc758830601so2061278a12.2
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378186; x=1795982986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=JtN6lXWDzGOjGLQrkUt/5D10teeFrhJLZvC9pm6u+i23cJ/5+dYGg7tHm/+AzTDccs
         tWa7VyuxBaaFeBl4oHDpGBFub2YhmY5e7mOLTyE7toynEPDttjfxfFfvPLRE4u6kBtMj
         T1F9sc0FG7SrpDL0nd+faywjbaYL+jboHKGW7qlrCAhNqEFsFE72zj4mCoPrqbIYu6vZ
         ntxr3mA+m05DD4J57m7AojhVSorxPiOBv0JMCKPRW3tDjVs58xewktH/kjEZaq44QGWl
         scN2g8SA4Fa+xOsmxQ7lOPVzg1fnHamoWYLDjtzpp8lOICzC18fvVYryRdWz0CuK1PCY
         mgtQ==
X-Forwarded-Encrypted: i=1; AL+hErGxwHPEBOMdRNbc68NPTvgjpnoBLUhQN69hS2y5g62oFXUgrYueSNyRQEcrOgesh/Lf2KDaVHSwEm8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/MwMBMSPnPPbS8hNPDicpM+l6hLPPQDn2bkvNf22Z+jo1plsos
	mrbFf+iyZ0oCjEouf/kMNCthTlSPGogjfoc77ke4jS1SJHGOnC/sSplCBbq4I46dpWQGfcch3mS
	xjIEuORF7FTuLqnzfF76MBtsPf7X02eoge1VsaBlSfUkkcTGkSRrR939UNkDteNDokYU5twq515
	3SY4IUWdgBUA0V2rR62WObjlk15BDQlxr2Ffncsz/X/Ix8HW5ON73ksBminMwvPw3Lr3QyQCZRM
	zDhWjwyPNQKk7SniJ+bGA==
X-Gm-Gg: AZFdTZc4d5fis+o1LJDVSpBjrZBKLmd7/3ScvTirBAja0AKdcAGHO/W0gd6F39HRsiF
	SCxNjQxHyB4PuqItMlJ9c/YRF7T5Y203pCgcnPGewUDIIY56WkZDng/lvOXxwboVE0/ToVpLrT0
	skJwVVstxAcZ4YIM7NfLeeLUkd73on17wgi8fBb4BMgTcJvDS/GVjEa6qGq5OjfoKW9UiBztmDf
	HLAt/GbfKDEJY5XnJl6XrXdnRz6nCFB5IgR5pY3LtbuLkT+d3aI/fz3OZ/RE5gBVre/YZ3xIdfZ
	ALT0UWIROIlqIiWyOBoGRJ0NOlvEWSceyxv3vkEqwg4GvkNQ6JyxnjH/liI6MTF6jorm6QGtTv7
	cCkieMxf8wy+VNBwgeHhcvJyrUa/qnnAn4UTUqa/j7m8XIPlhesmx2/NWHo9u0Dese9CCIdd1tG
	rBNO/qdDiny0nU3x+KjNx8qhe4G6nyRUe9lg2zX3rUKg==
X-Received: by 2002:a17:90b:17cb:b0:3b0:cc6f:1046 with SMTP id 98e67ed59e1d1-3b41c9bc517mr9411435a91.67.1795378186132;
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae59fa2sm6619110a91.8.2026.11.22.12.09.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so295663485a.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378183; x=1795982983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=VgqAV8J0c12zpY6cavxsXAwEMA9OVZwVogIG5Jv7U1eq25jTT6PhsgM+IzbmW6Hg5w
         mwEm3BLUafEvjAXKD934GQS38ab6Fu0MaaRqCfOn72NInN1a6ZHhT0ucm0J0oWO2lzNG
         fp69y5E/31RSX6x/Xqr/ZsNQwXhovmm52utj0=
X-Forwarded-Encrypted: i=1; AL+hErHCtRuhQUHfepZ97te4iRAnSWQ72I+vkSuz8perUTwE3V5mT1YAjCb1jSgVbjv9hpKfOFa08Q4L3OY=@lists.linux.dev
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703409585a.43.1795378183510;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703404485a.43.1795378183023;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:42 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 4/7] wifi: brcmfmac: create and remove the AWDL interface
Date: Sun, 22 Nov 2026 21:09:29 +0100
Message-ID: <20261122200931.2090372-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-5-dev@deq.rocks>
References: <20261104151547.70333-5-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 4 Nov 2026 16:15:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support takes an interface of type AWDL from
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73. The firmware
> answers with an interface event like for any other interface.
>
> The AWDL interface lives outside cfg80211. Add brcmf_awdl_add() and
> brcmf_awdl_del(), called with RTNL and the wiphy mutex held, which
> create and remove it together with a network device "awdl%d":
>
> - The interface events of the AWDL interface complete a wait in
>   brcmf_awdl_add() and brcmf_awdl_del() instead of going to the
>   cfg80211 handler. A vif_event armed for a P2P or AP interface at the
>   same time stays with that interface. When the firmware removes the
>   AWDL interface on its own, the event worker removes it as before.
> - The network device gets its own net_device_ops with open, stop and
>   start_xmit before it is registered. The firmware filters AWDL traffic
>   itself.
> - brcmf_net_attach() and brcmf_net_detach() also register and
>   unregister a network device outside cfg80211 with RTNL held.
> - brcmf_awdl_add() needs the AWDL feature and a free firmware
>   interface index 2.
> - The AWDL interface uses direct addressing like an AP, every peer
>   gets its own flowrings. brcmf_awdl_del() deletes them before it
>   stops AWDL and removes the interface.
> - The AWDL interface is removed in the cfg80211 suspend callback while
>   the firmware still takes commands.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 268 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  47 +++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  59 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 398 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> @@ -0,0 +1,268 @@
> +/**
> + * brcmf_awdl_add() - create the AWDL interface.
> + *
> + * @drvr: device.
> + * @mac: MAC address of the AWDL interface.
> + * @ndev: set to the network device of the AWDL interface.
> + *
> + * Called with RTNL and the wiphy mutex held. The interface uses the firmware interface index 2
> + * and the AWDL BSSID 00:25:00:ff:94:73, which the host passes to the
> + * firmware. Return: 0 or a negative error code.
> + */
> +int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
> +		   struct net_device **ndev)

Return: has to start its own line for kernel-doc. The kdoc check reports
no description for the return value of brcmf_awdl_add().

[...]

> @@ -0,0 +1,268 @@
> +	if (!err)
> +		left = wait_for_completion_timeout(&awdl->if_event,
> +						   BRCMF_AWDL_IF_TIMEOUT);
> +
> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	spin_unlock(&awdl->lock);
> +
> +	if (err) {
> +		bphy_err(drvr, "AWDL interface_create failed: %d\n", err);
> +		return err;
> +	}
> +	if (!left || !ifp) {
> +		bphy_err(drvr, "no interface event for the AWDL interface\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */

When the interface event does not arrive within BRCMF_AWDL_IF_TIMEOUT,
brcmf_awdl_add() returns -ETIMEDOUT but the interface stays created in
the firmware. If its event comes in later, adding is cleared so
brcmf_awdl_if_added() does not take it. brcmf_add_if() has stored the
ifp in iflist with interface index 2 by then and nothing removes it.
brcmf_awdl_ifidx_used() makes every following brcmf_awdl_add() fail
with -EBUSY until the device is detached.

On this path send interface_remove, and drop an ifp that shows up
afterwards with brcmf_awdl_drop_if() instead of leaving it in iflist.

[...]

> @@ -0,0 +1,268 @@
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */
> +	brcmf_proto_configure_addr_mode(drvr, ifp->ifidx, ADDR_DIRECT);
> +	err = brcmf_net_attach(ifp, true);
> +	if (err) {
> +		spin_lock(&awdl->lock);
> +		awdl->ifp = NULL;
> +		spin_unlock(&awdl->lock);
> +		brcmf_awdl_drop_if(drvr, ifp);
> +		return err;
> +	}
> +	brcmf_dbg(INFO, "%s: AWDL interface, bsscfgidx %d ifidx %d\n",
> +		  ifp->ndev->name, ifp->bsscfgidx, ifp->ifidx);
> +	*ndev = ifp->ndev;
> +	return 0;

The other brcmfmac interfaces get SET_NETDEV_DEV(ndev,
wiphy_dev(cfg->wiphy)) in cfg80211.c. The AWDL net_device has no parent
device, so /sys/class/net/awdl0/device does not exist and the interface
is not tied to the bus device in sysfs. udev and network managers that
match on bus path, driver or parent device do not find it. Add
SET_NETDEV_DEV(ifp->ndev, wiphy_dev(drvr->wiphy)) before
brcmf_net_attach().

[...]

> @@ -642,6 +640,42 @@ static const struct net_device_ops brcmf_netdev_ops_pri = {
>  	.ndo_set_rx_mode = brcmf_netdev_set_multicast_list
>  };
>
> +static int brcmf_awdl_netdev_open(struct net_device *ndev)
> +{
> +	struct brcmf_if *ifp = netdev_priv(ndev);
> +
> +	if (ifp->drvr->bus_if->state != BRCMF_BUS_UP)
> +		return -EAGAIN;
> +
> +	/* The firmware runs AWDL, the link is there while it exists */
> +	netif_carrier_on(ndev);
> +	netif_start_queue(ndev);
> +	return 0;
> +}
> +
> +static int brcmf_awdl_netdev_stop(struct net_device *ndev)
> +{
> +	netif_stop_queue(ndev);
> +	netif_carrier_off(ndev);
> +	return 0;
> +}
> +
> +/*
> + * The AWDL interface gets no multicast list and no MAC address change, the
> + * firmware filters AWDL traffic itself.
> + */
> +static const struct net_device_ops brcmf_netdev_ops_awdl = {
> +	.ndo_open = brcmf_awdl_netdev_open,
> +	.ndo_stop = brcmf_awdl_netdev_stop,
> +	.ndo_start_xmit = brcmf_netdev_start_xmit,
> +};
> +
> +static bool brcmf_netdev_is_brcmf(struct net_device *ndev)
> +{
> +	return ndev->netdev_ops == &brcmf_netdev_ops_pri ||
> +	       ndev->netdev_ops == &brcmf_netdev_ops_awdl;
> +}
> +
>  int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
>  {
>  	struct brcmf_pub *drvr = ifp->drvr;

brcmf_inetaddr_changed() finds the interface by its net_device, so an
IPv4 address on the AWDL interface reaches the ARP offload code. With
arp_version 1 that code uses the primary interface and adds the AWDL
address to its arp_hostip table, so the firmware answers ARP for the
AWDL address on the station interface. Skip ifp->awdl in
brcmf_inetaddr_changed().

It looks like this is the/another reason for the arpoe/ndoe patch [1]
sent. At least for the ARP disabling part.

Regards,
Arend

[1] https://patchwork.kernel.org/project/linux-wireless/patch/20261118123933.74517-1-dev@deq.rocks/
