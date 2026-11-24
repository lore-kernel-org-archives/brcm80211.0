Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551219;
	b=5GeXGGzyYqpuYUQnaas6IEQlvWGIEnaCpTWRlH9YUYKOxOv09CK9L8qpSyAPXFeXPkWI
	 adZeuCk7Mj31SX3rKrVxVpWZhmOMYq7gjcXOm3ZhRortnS78P3gMdGER5azvrwehzDx5V
	 UqGOuggg1rTlmyIUYrlwT0p1Tyi8H35sMo76j3L9Pba5beH+pGAYIbsJG58PKCkaeX6uc
	 zc+y/86o9koUUDSgjmsaRmydwY+pWDAO/Lc67J3RXkiPc8OaESJgN8/N2bYbxmlimr+Ww
	 GDeVLyLdlLGJ2BSM8M4K1+FzxgqVgfDhgjhizdWGujx43Ca0J5JieYG7vvOLmWEj9mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551219;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
	b=agMvTugbRSGgK4wJg/KrvkCM4ilHnXwPNFrpxXzwtOT9aGrlhV7JrFFxriZpiGSRdOLd
	 coFV+eRkKtuTWjS/KxeTdRSCckXvYaa6+6Vi5HLOfjdOTR8QNt+uqKf7UiAjwZvzHCei7
	 pj2xbr/OPOR5nyctPwx6ltMjFdFW8tvchSqjsU5Gwbqzt4cLvQ9+iEzo8fVwJU3lxSeCy
	 V41B29EeoZ8HiiASBwkEoP1mg4ig2Uc+TgIFo7dac5MGEhj8kKFIQpmkugCwwmS18DbpO
	 IAIkg2qru32z/BqaVbFuY31+ub7ipyJBvA9AARMS9FNpNSoVGTGC7EPBWuuMhXJCarg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFZ1kroG;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F05606A333
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3F05606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZFZ1kroG
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-943e8d35f74so488644785a.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551218; x=1796156018;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=gDHHLTD1AG2Nle5lPAcOM3NsVtmIymrNLag8ks39GEs/cD/N8UzyhhNgOul1T7e4Pt
         2OSGTkxGbENGljA9q75C5kEzGYTxxafvk3ojLr/3z7grJV+tjkmG1povUjuJvCJHC/4E
         lUr1/Xi/NxY2uIgXja62K23qYcRiYGJ3densG9ocvYhRaJQAqzwbwc6ar8yXMDogHvyo
         GKiC08U4v0vVRqBwv6bcsgCCSescaVSyhJOzx77a8a4ff4Jh2CByCn/YJjreR1Xo0Pbu
         1qe9Yl9e2GvLOrIyQyrhQ5HnQ5Wv4L7yYGssDJ6n6ZGz8/OyfBMwT2hSJYHhjX2z2+Tw
         mNJg==
X-Forwarded-Encrypted: i=1; AL+hErGr90yyxBZTTTdOGaLINdY86Ct7vFHVv7PS/+kRgedfysMSUKRX/Opou+U0xqDTZDvGdEuuFKFsam0=@lists.linux.dev
X-Gm-Message-State: APuU4Z/uhO9AR6q6seLb11wsVTw3IQuHzz0UmBDerrb9RElYMU/IRwcl
	bhDMo7c0flBwfnO3SzwpjgfjNGj7mpY9yQwPtLm9SP7enO2SrTm1GL6tEUy4gbYGbatxWlM7HoH
	YJv5QGAhwpmSFJyI4sBarLIBRsRjRfgNPtRcHzMHVCoRG1gzlWqlvZyXXCuGjXBz7pHd4ZFC2K7
	WlyBGl4xYIo/j2itOtEl2ZL+bLHjhd/m44AqgFBIqHmwSvBvDOHUspE2eC742Y6xEPMtStNyf6H
	fs5nTPd6uvdWsa+F8C/Aw==
X-Gm-Gg: AZFdTZd0bQwLxJZOeq3nCZVIFyzASSNUfBmypCYyjVT6x57MUGA2ZLEb+J3N8L1Fohv
	EYMJcP7iHfIbPS3zsob6UTzfhlMA4VZ8Pc5vDv303NeKjuy7rAGW7Zct0KLVGyHKYeZO/aUsnO3
	dU0aNfqnuG+vvAYnDaiMhxF8lDcRG21YA5w9mXL3IIjTw+fI/sd4hc9h1VI2p7r4vqlDt87pKdX
	4s1lLEmA29olqWZ8rrY+mnbD/pnsHROOJPulMnAwogdoGVpe0MQDjZgnsYP0QGWVL8gol5bf2sv
	m1PbINhKIRB7w+vi7L78XkkGvWkA0iujeAl3V4TBDdiRL/PZy96qZ8YDnhdXlYgjnkIu3cs2Hfz
	c/VC/Nzd0Wl7RUGTHS1v9d8nyHwMDPMcwzXANAG07NDNyYQqCKgCljobppnef7qTL9Kt1FqSIIo
	ZL6l+Tox7KQTqV9HU9IDBGGp3wwN4ZX0trIzM5MjEZ8A==
X-Received: by 2002:a05:620a:6c01:b0:949:9a01:597b with SMTP id af79cd13be357-949ba96e755mr2913332285a.29.1795551217677;
        Tue, 24 Nov 2026 12:13:37 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-949bb22c72dsm111413285a.6.2026.11.24.12.13.36
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:37 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5363b06bcb2so96809461cf.2
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551216; x=1796156016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=ZFZ1kroGNM7bs++pRFnnXtU2JEIbyP2fpTh0XkURPEn6EUEsz3TbOCKFx4tPYY7ciA
         Be/vEhzs5RNZROC+YEZMKQVTSZvOj+uZICVvEZgeyMR3h8jdZAsQ+6cpRrNXzbwKdHTP
         iqf8Nwwg8pBAgfTcbZlB4KZpfvlEl95luBUmQ=
X-Forwarded-Encrypted: i=1; AL+hErEP27XvHxpzAXS0M8IPGkCVonaAi0zWpdNEK5Jd3aXAp3DurnBf+VgEon3xhtgIVhPv+7eMX+MIbGM=@lists.linux.dev
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292105361cf.59.1795551216056;
        Tue, 24 Nov 2026 12:13:36 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292104831cf.59.1795551215467;
        Tue, 24 Nov 2026 12:13:35 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55db5bc2f31sm7518711cf.20.2026.11.24.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:34 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Tue, 24 Nov 2026 21:13:31 +0100
Message-ID: <20261124201331.3492571-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 18 Nov 2026 13:39:33 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4355 and BCM4364, ndoe makes downloads collapse.

[...]

> Fixes: 52f22fb21764 ("brcmfmac: add neighbor discovery offload ip address table configuration")
> Cc: stable@vger.kernel.org
> Closes: https://github.com/t2linux/kernel/issues/34
> Closes: https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
> Link: https://github.com/t2linux/linux-t2-patches/pull/85
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Co-developed-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

[...]

> @@ -103,6 +120,16 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>  
> +	/* With ND offload on while awake, the Apple firmware for the BCM4355
> +	 * and BCM4364 makes IPv6 downloads drop to low rates. macOS runs ARP
> +	 * and ND offload only in sleep, keep both off on these chips.
> +	 */
> +	if (enable && brcmf_is_apple_nd_offload_broken(ifp->drvr)) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on Apple BCM%x\n",
> +			  ifp->drvr->bus_if->chip);
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

The comment says IPv6 downloads drop, but according to the commit message
and Blaž's test report IPv4 downloads drop too on the BCM4355. Please
reword the comment to match.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
