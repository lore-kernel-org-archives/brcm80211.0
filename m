Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861448;
	b=iJMFkoDtNn45MqJlq45DVdIZHEmu+Gb/V+IIBhsjBbt3NAWcgoUhxKzX7ATEDSGhZYri
	 fHM0VUpjXU9yaF7Do+2k5RKfM64kchiSX7Q1u/9eIUNHrLBde/ib62hkZWHedW2eqj7JA
	 Rc0eFYKdkNcFhntKihyLYP8tfRsuZqKaIx4RmX4Oq4aGqi5E35EJHcQYAII/CHUijDd5H
	 QO6jw/NXsQUQuV4wT//K09corVCR9Hz+Bx7IjtrUXdRHC6yAZHNmY+nvJKBV9IH3Er4YD
	 OxVRkZmIOZFMAg2iLpE5p7IxfrYJZEWwBZfJ4Q0aVw9GyTpzTyPpEJL+8/mY5oAbEpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861448;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
	b=UlalvwsX6AgveOf91/61oKRC4m9KeS8vBtAxyCwDxsG8ZmO+M552SQxxpv58/HWgX98T
	 O0lkfiLZ5iJt4PU6LlC5UOk9aGlID6gkqSu0DUKB/L9MJX5F2k1fgzZTeJmBEOFpDCZz/
	 KXDriWLiSaitgEfnZ+U6DbuvXMbOGWrbOkKZAho0GMz3mquPIQS50yXY3ZyTILbJgJe5D
	 GICEp8c3eDZSLNJ3oMKKWAlHkJT0qP5EZpgVglwL1bXLL+JGCymLq3swPQX3znoTqq/Do
	 aW0S+tvAtaiEqtLVNZGLTKNOR2DJuSuhLCzgyQyfY5UWiKQXQGGUu9qCWR5f4vYjBLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xu0N9OHT;
	arc=none smtp.remote-ip=209.85.215.226
Received: from mail-pg1-f226.google.com (mail-pg1-f226.google.com [209.85.215.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5696C606A31C
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 20:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5696C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xu0N9OHT
Received: by mail-pg1-f226.google.com with SMTP id 41be03b00d2f7-cc758830601so3668737a12.2
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861447; x=1795466247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=jVJ4xe/gcPxSUv0E5Xxmcheecl8kzQH7auESgLfe7J/0D+cGRIZFwTB1bNcs9Bkpqo
         ADSFXMBYBPIddNwvmB9bfCv3kY0t1mRYzG5SYL0jLPYcsvQWyVUQ415V17mSgmHgppvM
         Bfw/qZjyzZlZllRQ1Bmyd1iT1VHKgUqjY6FMSqvq1Nm97qYrSgtTu7aTYUoFDjMlwyVe
         m0WM5icztgYFl7/bxpo7Y9vHAOLwZbP8u58H7UrLQQzIBuzZnSok/6vnMPaz3iik1DFq
         9l9mB4OESQaL6ID5jGAi13cw3Nyh2d4hqrpFAUIK8C51XvEApbSA5Qajy/Z+dtcUVDNl
         AHdA==
X-Forwarded-Encrypted: i=1; AL+hErEDZMu4PJRkV6vvguXTiaWAuK8KaIlV6mHy2RgwHgVIWO27iPmDxYbGehu3OxZ56CZbUriP0Bp4FSE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+4gZiTmo/k+zdZmnSW/+SB7fFfUTI/eMlSiQqLQRm0Rg0/wkEk
	tqpPAwWI3WDBf1aZZE3wt5M8vYggeER14s2GyiGvClTSE+kQQHiXwBq/wl2qqGWJIQM6NsaUhB9
	bOmVdzS56+0eMs1vrvsdJ0TBw+WK4w8T/qQBvVijChHR4il0dJilxwt/JLs8Q5KTTKJvA7coIFo
	0393ZmNcvtlFLfZcBwygZhK3emUji8tmHA0T7Hm+TrrRSE9P1zNBc1kreqQm8VlhHxfxtC5A8XG
	tiAJVYIr420ci+n9nHndQ==
X-Gm-Gg: AZFdTZdf6U8aT0vrPAsVe6Y4eLQsvtk6IfAFHKk2dYNYe6fiAjG0C2sj0OzBoa4C2rW
	LeOnKUn4GX/8aXV9zWZOcssY/xm+P/RYrhs9b9b/9TTp5lM/M1S3I2yLNKgPDu4CjW9nXTTBFqZ
	8SbxgnAnQKXisVE0KGuUIEsmAF5A/bXcVMy8P4iY8WGWp8kk7grPcAq1uOTciyl0vXW3kdtvcq+
	LBrQ6nYaxmFnHt2wtlfY2MRGgXiNplWyRYU9PUWw75xv4uq13LAknO6J/GoJ1pGNeGkyDao4HOI
	SZTovaDTsMd1zU5ALQJ+J7Me9hlgU+gaIvUJyUhB6OyWsDgORsswatoUi3eLXJBSh5u40N+zpsl
	omhxMP5Fsv6bOoux6z6PLuWWrdgeSVxlFN7lh6AdmjOtK3wDhceEX6uqFRDJIogbGxMC4ImLKkU
	lCg44vXsgy+WmLxCFfT+tiuRIE7Rj7fYBaQBmIZHE=
X-Received: by 2002:a17:90b:2c8d:b0:3ab:e588:c2a8 with SMTP id 98e67ed59e1d1-3b1b0d8a4d0mr11863925a91.64.1794861447392;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abceecbasm329319a91.3.2026.11.16.12.37.26
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-38131260a5dso306264eec.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861446; x=1795466246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YVbblNjtTs13Z97PdCw2KBjDlkIPD+IChpKyCjLOTc8=;
        b=Xu0N9OHToigqQymqwfgqlUqZJUSuzBdWgdt6JjYhRGrvLuNqDYa/UeH1+whfsdcLYc
         HKEncSRS5v0zj7zHhb9FnZyp7UDwLOAbCd4So8xlugeFoLcKYhvFeo5sdRToCzC0FP4j
         oNG5aFlt31wH5AlPCwnswmgQbiDn+OD0o3Eyo=
X-Forwarded-Encrypted: i=1; AL+hErFnL/Kuy7M9WPxCZNHjfLEL5tUiAwVMJ1wGcqPZB4FY6F9jDxH9c+DL0TDul4afUTselNoDet0QWmY=@lists.linux.dev
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214381eec.7.1794861445688;
        Mon, 16 Nov 2026 12:37:25 -0800 (PST)
X-Received: by 2002:a05:7300:d589:b0:36d:dd5a:4528 with SMTP id 5a478bee46e88-37966387cbemr12214351eec.7.1794861444883;
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:24 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: keep ARP and ND offload off on the BCM4364
Date: Mon, 16 Nov 2026 21:37:17 +0100
Message-ID: <20261116203719.281605-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151620.70671-1-dev@deq.rocks>
References: <20261104151620.70671-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:20 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4364, ndoe makes IPv6 downloads collapse.

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/core.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

> @@ -103,6 +104,15 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>
> +	/* With ND offload on while awake, the Apple firmware for the BCM4364
> +	 * makes IPv6 downloads drop to low rates. macOS runs ARP and ND
> +	 * offload only in sleep, keep both off on this chip.
> +	 */
> +	if (enable && ifp->drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on BCM4364\n");
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

A few comments:

1) The measurements only implicate ndoe. Do you have data showing arpoe
also needs to be off? Otherwise please limit this to ND offload.

2) The commit message says this is an issue of the Apple firmware, but the
check is on the chip ID only. The same chip IDs are also used with other
firmware builds and boards (WCC/non-Apple), which would lose the feature
needlessly. Please restrict the quirk to the affected platform, e.g. with
the Apple board type (settings->board_type) or a per-firmware quirk, or
move it to the vendor feat_attach callback instead of a chip check in
this helper. The same applies to the other chip ID quirks of this batch
(txbf and FWAUTH).

3) This looks like a bug fix. Please add a Fixes: tag and Cc: stable (as
Aditya suggested), and mark the target tree in the subject.

[...]

Regards,
Arend
