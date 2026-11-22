Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378189;
	b=1f6RzEt5w2SrYj9NOVbzyakxWvsc5BzlSntJ2PGUR8b8wwOJYcW7BNWS6Z9uZZ6bV3B5
	 gZVO+aGNPB5SVSRw09MFIcXUKuMDK12ZfHAwUCWK5wLLkFqRyGvPUxrfe0qB+USpkNsYM
	 6NIeR3e4vzZvKJbGAsvi8vtSzyO1+DtMkiHeL4s+RH7aFKnlZ2IxH8uHJogi+FlL3xiWX
	 CP4CoUb1f5jO2u5x4HdWDWMIAGBFUN4T5dAB18om/8rDCt67mbzQICKd2bwFuNnOUfTrt
	 LM6ZgaBuqIZDD59WZs+LCt7gr5M76pO60NzFH0gVKm6eBe09DqiwBzxFrB+FG76ceMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378189;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
	b=UpJ3lpguWos/C8N5Vk+ECLtXIkB31rYV2ZLVbUk2SIS23Db2jHR66U83b0j3djB4CqOU
	 eKIuC8JvUPe+DN7Je0gxHLJkZ+GCxPFtLv5ANzxL8ipyni4PQKy7DqG32Dh3d93UkeHZ7
	 dg+MXJLeb9Qz44pvfpywWsSxBBKoEgfQstFfm3/6QsNzYzFkAX+UaF+nXYZ/3f62Fy2c8
	 pdniAJnaV8FNBaE30QbT56HIzJBSShypTB0AvRvLmgL1LST45HlUz86eNLgvOCCO5KsdK
	 aA00IFj7qE6J/Kxj71FyZkBAUXqu+8xQx2NTdcjSgn1w8TPplKmPeWAT3EKjMcIG5+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C3v195SN;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03318606A327
	for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 20:09:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03318606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=C3v195SN
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1281965a12.1
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378188; x=1795982988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=YBe6H0r3w/eeQjMWn3GIXxaOxRYne3PtZBW3eX8wPDWY32dnWjAQ7uIBsRaxV+vmQt
         tD0a8n7bUFKSfCtTA1QbU78x7lhzA1SJWAX2zHKvK+NeQkyUYYMw+N1ySv8oXl3PsGH8
         suUJAGvpUaBo2J45giaEjum0uPO6hGZq5oq1tRgZoU4Z/jh9sNpj0GtKicOddQQD77Xu
         N/XIdxpvzJtE/ihUdzghGgZLZDNH7Qlm2YxWGcPIKWEpNxtL4wpIe9HTGaEikWmrxeuK
         W23QZDvFcAfHRcpk5HXkZoEsJhQLPtTYqdcEjVTAEMXw78yC8ls8dAwqqTfe+XOpfgNO
         QOYg==
X-Forwarded-Encrypted: i=1; AL+hErE6WsgAZCYAwC0GvSlfh+udLJBHzBYYl3VSHfmp+cez0qJJuI1fBsAZu4qIAS2mxQftHS85IOYOPxo=@lists.linux.dev
X-Gm-Message-State: APuU4Z9xK9LWu6rL2kRVcdw0fVupSSFjeEOUYcHRUGFP4KJhfmcCE994
	k8ZjMk3jYKj5q/DQxTcr3DZ7hAmIloeWHOb2OHSKIDAs0gwwThYairagUeQjtG+gIrptYNfFDWF
	shwsNw3D8iDV60BBXN1Bk0XyXcTNkUzQ3AlB+d2PpTXb0c6GOqr+TibYuJQzpwG08nXxnXabLm8
	GB3pzzF0sEjynEBb+F/E0AFOyLqPlKjO1qCfNE/Q2n1Wcz6/+1SJ5Mhc3zU06klkLMJNmI2Gl/Y
	aqNajGn1uzyshnMj9+CWA==
X-Gm-Gg: AZFdTZdl6N/YiQRLpQXHkRfmSFN4oELVU+4VMwHzHPBb5zx9IjV59LY6lVrQb6jRVgo
	iqwtN1XJXrsGCSju6x4VEww425NZyJTBEbIu5GyRi8vEFuZLk40WJlnt23A2VegUNmIl0o+rS/s
	uHx1yDOpD5WoNhnqx7N9NDJEmBiQx8aeWMg5YOw9kvYglqfLRSxOIcAdkCEBcWceGoSXsm5JEZ6
	gV3N5xv+O5Pb2tcHIYodVYEg+uvqY6f8tQZmbmVVErN+QWy7SleGFxfabdwtg01uQRn0a87N9g5
	niIZp5o7ZVo+PjiMDzsWa0u2mD4KNuJvhGQZFvofoltuJhjOKB5vU3K5UnyO0fe6V5cfgHu3OzC
	WAwGkvrfLG00dEdlaUVcleg8QNzlrjyxjBqvLw59VxWuv+T+605IWWpOZilhKcjZZFnyKFrlWYu
	eKglQSqzvXbp33sGnBlIleNPb7hqUA2Jec8M+qQ9qEhg==
X-Received: by 2002:a17:90b:3f43:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3b41c8e0512mr5988400a91.15.1795378188171;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add899dsm6630856a91.3.2026.11.22.12.09.47
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so505332585a.0
        for <brcm80211@lists.linux.dev>; Sun, 22 Nov 2026 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378186; x=1795982986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=C3v195SNrKR2Rdq9ubNk7VEMeruW+ZKzq4H5UgjRWsARUTldFP0/2iaQELj/06eGI5
         neVEJtjH2jEPa+uN6FSBIn/0jbqdIDQingJlqnOW0U8m2cPNtIyrZkmKYJXe+MicRiP9
         hsehuViLKc/3xrkvbK0OvwyO5r1U77UVeMNwk=
X-Forwarded-Encrypted: i=1; AL+hErGSNKhDjru1ahbHTBUPdJo5jh4+m+h2ZKBQ0lOpavyHMIJCOzZxshscxSBbzhuP8xrOf6YSQr+QFgc=@lists.linux.dev
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654099685a.32.1795378186219;
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654096085a.32.1795378185743;
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 6/7] wifi: brcmfmac: add vendor commands for AWDL
Date: Sun, 22 Nov 2026 21:09:30 +0100
Message-ID: <20261122200931.2090372-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-7-dev@deq.rocks>
References: <20261104151547.70333-7-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space. The
> firmware sends and receives the AWDL frames and the data once the host
> has set its AWDL parameters. Add vendor commands of the Broadcom OUI on
> the primary interface for that:
>
> - AWDL_START creates the AWDL interface with the given MAC address and
>   starts AWDL with the given TLVs. AWDL_STOP stops it and removes the
>   interface. Registering and unregistering the network device needs
>   RTNL, vendor commands run with the wiphy lock only. Both commands
>   therefore run in a work item and report their result with the vendor
>   events AWDL_STARTED and AWDL_STOPPED.
> - AWDL_SET_FRAMES replaces the TLVs the firmware sends, the TLVs of
>   awdl_payload and awdl_oob_af_auto. The driver adds the headers.
> - AWDL_SET_SYNC sets the master to synchronize to, with its metric and
>   the distance to it. Leaving out the master makes the device its own
>   master.
> - AWDL_PEER_ADD and AWDL_PEER_DEL add and remove a peer data frames go
>   to. AWDL_PEER_ADD takes the HT and VHT capabilities elements of the
>   peer, which macOS builds from the AWDL TLVs of the peer and passes in
>   awdl_peer_op.
>
> The other firmware parameters of AWDL are set by the driver in the
> order and with the values macOS 15.4.1 sets on the BCM4377 of a
> MacBookAir9,1. The BCM4364 gets slot_bss without SDB,
> its firmware traps with the SDB form while the station is on 5 GHz.
> Some parameters change 500 ms and 5 s after the start.
>
> The AWDL interface is removed before system sleep with an AWDL_STOPPED
> event.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 586 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  78 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  86 +++
>  5 files changed, 804 insertions(+), 4 deletions(-)

[...]

> @@ -53,10 +58,123 @@ static const u8 brcmf_awdl_bssid[ETH_ALEN] = {
> +};
> +
> +/* awdl_election_tree: the master at 0x0f, its metric at 0x15, distance 0x19 */
> +#define BRCMF_AWDL_ELECTION_ADDR	0x0f
> +#define BRCMF_AWDL_ELECTION_METRIC	0x15
> +#define BRCMF_AWDL_ELECTION_DISTANCE	0x19
> +static const u8 brcmf_awdl_election_tree[] = {
> +	0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x00,
> +	0x05, 0xba, 0x00, 0x00, 0x01, 0x03, 0x04, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00,
> +};
> +
> +/*

These tables are patched at fixed offsets (0x0f, 0x15 and 0x19 here, and
in slot_bss, awdl_opmode and awdl_peer_op). Say in a comment that they
are copied from the macOS trace and not otherwise documented, and name
the firmware versions they were verified on.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +/* Sets a firmware parameter of the AWDL interface, errors are only logged */
> +static void brcmf_awdl_set(struct brcmf_if *ifp, const char *name,
> +			   const void *data, u32 len)
> +{
> +	int err;
> +
> +	err = brcmf_fil_iovar_data_set(ifp, name, data, len);
> +	if (err)
> +		brcmf_dbg(INFO, "AWDL %s: %d\n", name, err);
> +}
> +

brcmf_awdl_set() only logs a failure at INFO level, so AWDL_START
reports status 0 when the firmware rejected awdl, awdl_config or
slot_bss and AWDL is not running. Return the error from
brcmf_awdl_set() and fail brcmf_awdl_enable() on the iovars AWDL needs
(at least awdl, awdl_config and slot_bss). User space then gets the
error in AWDL_STARTED and the interface is removed again. The same
goes for brcmf_awdl_refresh(), which makes SET_FRAMES and SET_SYNC
return 0 whatever the firmware says.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +	u8 buf[sizeof(brcmf_awdl_slot_bss)];
> +	u8 *s0, *s1;
> +	int i;
> +
> +	memcpy(buf, brcmf_awdl_slot_bss, sizeof(buf));
> +	/* The BCM4364 firmware traps with the SDB form while the station is
> +	 * on 5 GHz
> +	 */
> +	if (drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		buf[BRCMF_AWDL_SLOT_SDB] = BRCMF_AWDL_SLOT_SDB_OFF;
> +		for (i = 0; i < BRCMF_AWDL_SLOTS; i++) {
> +			s0 = buf + BRCMF_AWDL_SLOT_SLICE0 + 2 * i;
> +			s1 = buf + BRCMF_AWDL_SLOT_SLICE1 + 2 * i;
> +			if (!get_unaligned_le16(s0))
> +				memcpy(s0, s1, 2);
> +			memset(s1, 0, 2);
> +		}
> +	}
> +	brcmf_awdl_set(drvr->awdl.ifp, "slot_bss", buf, sizeof(buf));
> +}
> +

Chip checks like this one are not preferred. feature.c already
carries the per-chip and per-firmware handling (quirks). Set a quirk
for the BCM4364 there and test it here.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +int brcmf_awdl_vndr_stop(struct wiphy *wiphy, struct wireless_dev *wdev,
> +			 const void *data, int len)
> +{
> +	struct nlattr *tb[BRCMF_AWDL_ATTR_MAX + 1];
> +	struct brcmf_pub *drvr;
> +	struct brcmf_awdl *awdl;
> +
> +	drvr = brcmf_awdl_vndr_parse(wiphy, data, len, tb);
> +	if (IS_ERR(drvr))
> +		return PTR_ERR(drvr);
> +	awdl = &drvr->awdl;
> +	if (awdl->detached)
> +		return -ENODEV;
> +	if (!awdl->ifp && awdl->op != BRCMF_AWDL_OP_START)
> +		return -ENOENT;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_STOP;
> +	spin_unlock(&awdl->lock);
> +	schedule_work(&awdl->ctrl_work);
> +	return 0;
> +}

AWDL_STOP while AWDL_START is still queued replaces the pending
operation, there is a single op slot. The START is dropped without an
AWDL_STARTED event, and the STOP finds no interface and reports
AWDL_STOPPED with -ENOENT. User space that sends START and STOP back to
back gets a start that is never answered. Reject the STOP with -EBUSY
while a START is pending, or keep both operations pending and run them
in order.

[...]

> @@ -8,12 +8,97 @@
>
> +/**
> + * enum brcmf_vndr_evts - vendor events of the Broadcom OUI
> + *
> + * @BRCMF_VNDR_EVTS_AWDL_STARTED: result of %BRCMF_VNDR_CMDS_AWDL_START with
> + *	%BRCMF_AWDL_ATTR_STATUS and, on success, %BRCMF_AWDL_ATTR_IFINDEX.
> + * @BRCMF_VNDR_EVTS_AWDL_STOPPED: the AWDL interface was removed, after
> + *	%BRCMF_VNDR_CMDS_AWDL_STOP or before system sleep, with
> + *	%BRCMF_AWDL_ATTR_STATUS.
> + * @BRCMF_VNDR_EVTS_LAST: number of vendor events.
> + *
> + * The value of an event is its index in the vendor events and its vendor
> + * subcommand.
> + */
> +enum brcmf_vndr_evts {
> +	BRCMF_VNDR_EVTS_AWDL_STARTED,
> +	BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +	BRCMF_VNDR_EVTS_LAST
> +};
> +
> +/**
> + * enum brcmf_awdl_attrs - attributes of the AWDL vendor commands and events
> + *
> + * @BRCMF_AWDL_ATTR_ADDR: MAC address, of the AWDL interface or of a peer.
> + * @BRCMF_AWDL_ATTR_PAYLOAD: AWDL TLVs for the firmware parameter
> + *	awdl_payload.
> + * @BRCMF_AWDL_ATTR_OOB: AWDL TLVs for the firmware parameter
> + *	awdl_oob_af_auto.
> + * @BRCMF_AWDL_ATTR_MASTER: MAC address of the master (u8[6]).

Two points on this interface. The vendor commands are the exception
agreed for AWDL, which makes this header ABI that cannot change after
merge:

- AWDL_STOPPED is only sent for AWDL_STOP and before suspend. When the
  firmware removes the AWDL interface on its own
  (brcmf_awdl_if_removed() in patch 4) the net_device disappears and
  user space is not told. Send AWDL_STOPPED in that case as well.
- brcmf_vndr_cmds and brcmf_awdl_attrs start with an UNSPEC entry,
  brcmf_vndr_evts does not, so AWDL_STARTED is subcommand 0. Add an
  UNSPEC entry here, and describe BRCMF_AWDL_ATTR_UNSPEC in the
  kernel-doc, the kdoc check warns about it.

Regards,
Arend
