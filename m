Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861455;
	b=KOqxHNWjiHhAZLbBKePVUWPgxJA5pHmVXuMYCKX/e8/S5/cNzA4rcynFkxyoJ4mlhqD2
	 Tl8nlC8fPiVijq9W1N50ahZ79h6EK5n32iQmeWBaGUcXW6w1VTn33X9gtZqxXLfWwvlih
	 wWmNWg2gLSfGg3cOjAd3haw4q4Ya/7MffH09AQS2AHfSfgvFEMwf2EnzJhCPuMuG0p5WA
	 UTv54XEiNNSU4Eq5TywNZoQl+vF5tA5ru69k27vpa3n2XuRlZNREymX0dLgHwRj4LGHyD
	 RkVRZxkRdcAgUWXj849urFWXOKm52sBy2/1Ia9NNsIYySdbMJVmyTtKSDQHRjpzUzFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861455;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
	b=LIlrMzueCgT9Uhjp/BzOIXmxugtSMVh4PwHdYZ9F//LnP+NuiYJlX0Hgf253kx3OVsXs
	 p7fT7X0nckSQDkf2K8I0pBczx+g2QjPzg7CM2QBfVsgMu2S5fmj9LtopEcbRLId2FZ73N
	 Ui4IoqfLoHE20/+eB1n4Fh/TR8yQy+8KeZqXtRs0cLiYzFX5oAaEwi6HjoMcDP/E4cn2W
	 tyHcy8E/J5IeLk6qk8xOs3GnI3QEQ8v27iCoNAw0lC3ykQYSdbfcqPDLEoYSKeyYnNnzd
	 lHwPFsudXPIshzO6x2MzrGbd0zqF1HFPzZWDlxlBnrDr+JUjVJzFynaB2lhTnkAOKOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QoJE3Eib;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF25606A334
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 20:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF25606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=QoJE3Eib
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso169640a91.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861454; x=1795466254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=XGwZ6JivdD2eQuMKlKyQhuVci3RZtbOPColuJz+Gj+C6wNCi4CSYQbTdeBOyqc9/wc
         gfWMjayNlGYUJJmanOWecVpNb7yoje6hLOU1BFYfmfJmqpGt2RNNNlieGPAqdzLFQD/D
         00nVVGMLGszzdSuYG2LtLuHgDmBG4J5gK9UApP6DUh35sLPXyjEASRubZJz19Yb3/OCY
         TVx+V3YTXkKrjAxuuwmQDpNsjstlozpByKZK7aaHyVw/FNesrWGLnrcMnN+clVMZyvt8
         m2r12E6tW5pWB8Yt9zx3q9hrbIXY74ajTjqvdDAUy5ogxPmh6u3+GGNIMEetTKi1BlkG
         exMw==
X-Forwarded-Encrypted: i=1; AL+hErFeE7hgz293nyaAcf4mwo/6UCLWZzsctHGxc2MSlZkJHtpajrvJFEgHHRkDZUPfs1OET0o3gt2NEfo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8SYWNnLMC90/ScUvDxFOk+VwYmOWHdZGcBc4GCFd16+gRxqClE
	ZNORDa18Lw7fGAub/bx6Ld6M3ZLiNzvdkgBMjojeHOXiACxvLuFr8UBFo+hlz+kWqIrRhl+3szt
	4uR68iHdSfd9uLl1+8PaXQK1cEluFbVG1L4CSkGvSrRjuIl+umjzk7bLqbM5qEUL6+1ITTisLbP
	wu0DcKo2MBhgZ3Oiv/Yo8Ix7tN/sG39xEqm125M+t/VPszmgLSVMFE7tcVKp1x8k+Jz76byFNoj
	vkSLkC0ksOmk6s+NdeovQ==
X-Gm-Gg: AZFdTZeNkcUVs0sHgHKKlAXeBGRnviCA3FA5rjLc2oFf00d/CvtY4XPv+FqzSRgG6cI
	XWpAm6oYjPMZcPyAJ2Cl+rU/HSqj1aMAldmk3WWsZDjCoErzY2D+xujrmQ6mgrigQyStnMCID3d
	GVFxZ0uwnOLsfqbZW5zwhrqNvQ03YC+6nPPyBM18ylGx/0RTFpxkk3WVqgOwN2Ra3f8ZhVaC02Q
	22mlBnEgZ3xgN8qokg7k+3EYJtvsaLq5P/JCMFPkUqbqGKZ47rqY2ww93kBCNA+9sx/aqycUw2N
	kiuJ2wKXZ9V6XohTgnC6yt49sv+nCTxh6MsRZ0qn/H4/94atdZFdBkgzysRQy+GLdbn7rABysS4
	Uh6W2FVzPoKY9I4GKuBZOPacgv3i4nIGnpufMDastMsapIkQdJObYwsgu1+3PYu/cSeoeU3ywHt
	WKElNNK62a1SuBTpWHXcVyvNv5UEqukzs+Yk7jQwc36Q==
X-Received: by 2002:a17:90b:2784:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b3abb530efmr308254a91.17.1794861453713;
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3a2d07d60sm453474a91.2.2026.11.16.12.37.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so187690eec.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861452; x=1795466252; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ur1Ul2Xf/shlppt5zC3CiqKndxvZl78A8xthMxJt+3U=;
        b=QoJE3Eib46cysDKeePmsxsivlob++OobhlwjS0j9fR7CodOzgC/GO8m2r9pH2Djez6
         qUFfEBYWOfA4b3jbTDyN+vgo6KkyG9HBpB4/uixH0byBBat+2eXPT6QlFATsNgpLBxFt
         MO+7tao7/Jbhi3nE4RXZ4l8hFp6hYdRUwkWJ0=
X-Forwarded-Encrypted: i=1; AL+hErFTCuwv0WUqY2gp5F1taQM0GKqi0oqbHQ0QwExpMrhaSl7SPgRUK6RVHYPdSX+gLK2N2u5lc+2296U=@lists.linux.dev
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522309eec.11.1794861451753;
        Mon, 16 Nov 2026 12:37:31 -0800 (PST)
X-Received: by 2002:a05:7301:3a91:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-3810cd4e36bmr522268eec.11.1794861450737;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:29 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: leave the AP 4-way handshake to the host on Apple chips
Date: Mon, 16 Nov 2026 21:37:19 +0100
Message-ID: <20261116203719.281605-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151629.70790-1-dev@deq.rocks>
References: <20261104151629.70790-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:29 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The Apple firmware for the BCM4364 and BCM4377 lists "idauth" in its
> capabilities, so brcmfmac enables BRCMF_FEAT_FWAUTH and advertises
> NL80211_EXT_FEATURE_4WAY_HANDSHAKE_AP_PSK. hostapd and wpa_supplicant
> then pass the PSK to the driver and leave the AP side of the 4-way
> handshake to the firmware. On the BCM4364 that handshake never
> completes.
>
> [...]
>
> Clear BRCMF_FEAT_FWAUTH on the chips in Apple's T2 Macs, so the host
> runs the handshake.

[...]

> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

> @@ -318,6 +318,20 @@ void brcmf_feat_attach(struct brcmf_pub *drvr)
>  					BIT(BRCMF_FEAT_WOWL_GTK);
>  		}
>  	}
> +	/* The Apple firmware for these chips lists "idauth", but in AP mode
> +	 * its authenticator never completes the 4-way handshake and the
> +	 * station is dropped after about 8 s. Leave the handshake to the host.
> +	 */
> +	switch (drvr->bus_if->chip) {
> +	case BRCM_CC_4355_CHIP_ID:
> +	case BRCM_CC_4364_CHIP_ID:
> +	case BRCM_CC_4377_CHIP_ID:
> +		ifp->drvr->feat_flags &= ~BIT(BRCMF_FEAT_FWAUTH);
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	/* MBSS does not work for all chips */
>  	switch (drvr->bus_if->chip) {

The commit message and the test report only cover BCM4364 and BCM4377,
but the code also clears FWAUTH for BCM4355. Where does that come from?
Was it tested, and is BCM4355 found in T2 Macs? If not, please drop it
or justify it.

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the Apple firmware, but the quirk
applies to every BCM4355, BCM4364 and BCM4377, and those users would lose
offloaded AP PSK. Please restrict it as suggested there.

Note that BRCMF_FEAT_FWAUTH is required for NL80211_EXT_FEATURE_SAE_OFFLOAD_AP
in brcmf_setup_wiphy(). Please mention in the commit message whether
that is affected on these chips (i.e. whether the firmware offers "sae"
at all) or confirm it is intentionally dropped too.

Have you looked at the actual root cause (e.g. missing/incorrect
"idauth" related iovars such as setting the PMK or wsec_info for AP on
this firmware)? If the offload is never usable on these firmwares, say
so in the commit message with reference to the firmware version(s)
checked.

[...]

Minor: please add the target tree to the subject (wifibot series_format
warning).

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
