Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709703;
	b=BzzTvCg0vrHi+T2zc1NkTjfTatzWlPMbj9BAK50gqa2GP47lEwRAuV1VXabV9cVhJyXJ
	 fxvzJxAW0/cohlQg7g5S3s0RAqxi00Dmz/vSJzYAiUyaZiM5qS6Qaq8BDwFYlSA8hNRn+
	 MpqbbkGk9xt0jIq/0azd4JiSdjrmnHuJDG3WHnP6u86trgDQpwiCiAB9UMHLGqPlZ94JL
	 oUpL/EeclIZuiFI6WH5vMW2JQfkkM1O779PxRA8N0p0V6E25L16eE/WM4paccodFb+Co9
	 xKYbbbHK+LcKjdsLEZNwJKSK95+ZNOflLrKIcM2jQK1IrqUJZw8hVihhoXtoq3pChsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709703;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
	b=LMsLQT7F3Z7KgFFdg4jTS6TpOz8mlg0qi1J5ew+xouV45m0UQZPfnxBN7USonmNFC81t
	 auns2TCjJgGsJUPPkSv0nhENWhb7KG/RennHxrtlOY5E5cxiEQ1ZSnlHLUd07jvQhT32p
	 1m5KFoZszdCXqCaLgQ9rYGM4K4ljlvASE/CqO4eOzm3QzfsQ7uyT9pZn7Mx8FRzjuLjPf
	 msG1rwDialeqOXxtwmWPN6mbxC6oceqXereVICXMES50Ka8Gs6qTQ7SC0HFWykb29Vodg
	 P+QlMjjZL3tXCbcIc2dFJXTET1Gwpq1omDhcLNmre5/4+sZvyC1SgLhWMx5xTrlKy/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D4Fe61JO;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0F5606A6B3
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC0F5606A6B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=D4Fe61JO
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cc751eddf25so4602601a12.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709701; x=1796314501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=l+OYTBAjXw9tkKC933VwzrurGoFOei61X+BUvDRtw4za+KuobQR94nDMS84ru5L4xV
         m9p4MYrkdpJrgQ1CjBapFBRjak75w6/ETxk0WbMprH87oxh+4ymCasVLv5OlLnkgoFMP
         IPWAQTqSD6Tzk5p6BUMFboDFHxqkj9jeFkuLvoftTmAL9pbMvrIhJ02vd3RqjYYrkf0J
         czf9pANa8Mkp+rz48QraNqCdBt5FCcI7pzCRzem3NixEAPV/C7n5JBHX0+Yk9Xc+j4Cp
         J0rRbkg9RNUh4Fioe7xymG0m7lHvwho9rGQUZ6XfjoRM2FiOG5HEuzelh9h5AzbXZpoV
         eVyQ==
X-Forwarded-Encrypted: i=1; AL+hErFbH85Kuyv+m9QGZGWAoAWto2ofQ0IgQxb0GGpHhZi5SIqvZrbk+a5tDzRvN5KGy1zgHCwfbtncmfE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+nFR2G2meFIGrxjAvXIcOreMimeiWm+SAyn0ouMDOGSjcS/Oao
	NDU7EdmaLHrxs+o+s4a4W180866SE7stjv7tY6EvzWS2fLAmmeQbVD13AXM0Sj8Qh0jZ5wAMQI2
	XeJGb2JIDj1IqGGHyxxOarfYz8xr1AGkuk4Fb7kBklFG8VdzHCb9i+S+fE0b/h1RggleShLIn0D
	Dg812Ivp+jXOqfhVZU60UmBvluAL968OwpWzC1w8NCH2e4bn8ziT1kQVKePH0Wqal6fryszcpMo
	FA42zLnOg2K9Fycg9hQnA==
X-Gm-Gg: AZFdTZdJwEFDR+C8T9vugg74XEoX+db56rzAeIG5S522tJef60bPVFPSXK/9drJmS1K
	AlYIYfJYQ3juU47RXg2VgQpPN/+7lK2cBdvybbXXsCSeARxhLqrZbbMe+/xAVTaSlcikwrv0gGj
	j6EoqLkql6EoZO9u2860hvqrpD2KRGEA0dZXjvx0OLAu7rPyRdcHJCzXY69zWcVk97l7IY6z/bv
	U1EhL4jiZj1MTx6ZxsVRrVIk147cXIBgyacu+CIXlqyZJPSCbr+yuaMxGG25gEpzOaO5kJsS12J
	fixmg/RBl/DBgVeUCn1MNbd/c87aMy6rkvNnxFl1qZqZq6dH/WZoOPn8gUaLAYL5wMpfBTNQkkK
	slWinOlSy/ohtFVcFfi5h7qVOCkUVTpwN7Zh5Ur8l8wklEsjNf5x5ZeIlSMOuP3OoHkjWTNXB8l
	4f5YEQY+Ge4qEYD0+zFJB9cCex6IKrWDL4+rMcIMQ=
X-Received: by 2002:a17:90a:c10e:b0:3ac:9d83:8856 with SMTP id 98e67ed59e1d1-3b41c7e1181mr22777941a91.9.1795709701088;
        Thu, 26 Nov 2026 08:15:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ac84fd5sm15478740a91.2.2026.11.26.08.15.00
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:15:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso964330085a.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709700; x=1796314500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=D4Fe61JO6pias8fB+wpYeK6DCEppRlF5FnHfUDivD2nMM/INWKUKFiTSiq62Hhlcnh
         CQLI8PFIY854vTFRiN1tCxOsdrp77cmD7jvu0Ed0egmBj+f3b6u6XSa00CBnodjhQBy6
         TkIDW1PZC5fudEB78jto8i1OuicKluo1lq7sk=
X-Forwarded-Encrypted: i=1; AL+hErGOIlWLrSYs4LT/ilFXqB7xnSqiOpguzfvlUppnB6CwflbRITEoyGL5pd7TbTckBRoX1WcfGL9yzg0=@lists.linux.dev
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583053785a.0.1795709699846;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583049185a.0.1795709699285;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 5/6] wifi: brcmfmac: add vendor commands for AWDL
Date: Thu, 26 Nov 2026 17:14:44 +0100
Message-ID: <20261126161444.2484980-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-6-dev@deq.rocks>
References: <20261125190254.176055-6-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:53 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space, the
> firmware carries the AWDL frames and data. Add vendor commands of the
> Broadcom OUI on the primary interface, described in vendor.h:

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 644 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/feature.c     |   6 +
>  .../broadcom/brcm80211/brcmfmac/feature.h     |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  82 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  92 +++
>  7 files changed, 881 insertions(+), 6 deletions(-)

[...]

> @@ -116,9 +238,12 @@ bool brcmf_awdl_if_removed(struct brcmf_pub *drvr, struct brcmf_if *ifp)
>  			awdl->ifp = NULL;
>  	}
>  	spin_unlock(&awdl->lock);
> -	if (!requested)
> +	if (!requested) {
>  		brcmf_proto_configure_addr_mode(drvr, ifp->ifidx,
>  						ADDR_INDIRECT);
> +		brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +				       -ENOLINK, NULL);
> +	}
>  	return requested;
>  }

brcmf_awdl_if_removed() clears awdl->ifp in the firmware event worker
without the wiphy mutex, and brcmf_fweh_handle_if_event() then
unregisters the net_device and frees the ifp from there too. awdl.h
says changes of @ifp hold RTNL and the wiphy mutex. The vendor commands
(wiphy mutex only) and aftx_work/settle_work check awdl->ifp and then
use it several times, so a firmware initiated removal in between gives a
NULL pointer or a freed ifp in brcmf_fil_iovar_data_set().

AWDL_STOPPED is also sent before the interface is gone on the host, so
a START sent in reaction to it can still fail with -EBUSY from
brcmf_awdl_ifidx_used().

Handing the unsolicited removal over to a work item that runs with RTNL
and the wiphy mutex, and sends AWDL_STOPPED when it is done, would fix
both. The event worker itself cannot take the locks because
brcmf_awdl_add() and brcmf_awdl_del() wait for its events with them held.

[...]

> +/*
> + * Removes the AWDL interface before system sleep, with RTNL and the wiphy
> + * mutex held, while the firmware still takes commands. A queued operation is
> + * dropped.
> + */
> +void brcmf_awdl_suspend(struct brcmf_pub *drvr)
> +{
> +	struct brcmf_awdl *awdl = &drvr->awdl;
> +	int err;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_NONE;
> +	spin_unlock(&awdl->lock);
> +	if (!awdl->ifp)
> +		return;
> +	err = brcmf_awdl_del(drvr);
> +	brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED, err, NULL);
> +}

A queued AWDL_START is dropped here without an AWDL_STARTED event, user
space waits for an answer that never comes. Answer a dropped START with
AWDL_STARTED and an error (e.g. -ECANCELED).

[...]

> + * @BRCMF_VNDR_CMDS_AWDL_SET_SYNC: synchronize to the master of
> + *	%BRCMF_AWDL_ATTR_MASTER, %BRCMF_AWDL_ATTR_MASTER_METRIC and
> + *	%BRCMF_AWDL_ATTR_MASTER_DISTANCE. Without %BRCMF_AWDL_ATTR_MASTER the
> + *	device is its own master.

The commit message says awdl_opmode fails while the firmware does not
know a new master yet, and SET_SYNC returns the first error of the
refresh. So user space gets an error on a normal master change and only
the next SET_FRAMES or SET_SYNC sends awdl_opmode again. As this is ABI
it better be documented here, or do not return that error.

[...]

Regards,
Arend
