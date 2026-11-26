Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709693;
	b=IrRlrGCrkTgRl/RudBys70WMOEJ7RjsDr7S8Eop/EFhI1q4oD9f3X9wMCHYbLt25r+BB
	 8FXqdoJ/rOQxegwSPMQbKvABPS/wPW8gEd0VjdkTLxemUAvu0SUrDhbprNU8w+JqL+n3q
	 VyB3CrVUzvd+sF5QdtHUTMiPpxe525gyg88jOxXOatYZsWEN3Sc07cuuXEK04prag355g
	 mX5/RZS5ur8mRZ8qU2wf5jrdtBdHkR+uBIveruyVHJy5aqTll4sYhZGTsUlkJW2eeAyiM
	 gYKvQr6qXRs0ocNbePjgu12tbMzRMzedWc8VZuflpYslwlwyFQNzKVVknmLQ5XuzW6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709693;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
	b=h1ksVqiPCS85aAJE3zbX4RECvL7MynPmqPxrLuEyVuDdmER1f33mQXAYjgUuhP3gUrbp
	 gbySezf7gvECj7oMxrBuaooliEgfAlZcHYCaX5keNPIAH9BqQXKNSqpELqZ5KSIUh4EwB
	 ZCGzbsSeOjK5Fpqe7fQ+dFQq8fIwBI2FbAjOruFonCo3RpTk0rwkcn6DO02XMlMwckLqU
	 Gg0kU3QHxWc22ObF/58mpPU4dwfBkcgZdQAzh0zLv54FU9acVB4y+iahSKnqgmMkFiUEq
	 X5aj1VuzUC7se5A5luGF8iTjaWuP3Kb23az6GM9ei1P0onKJzX4NaXdvAfXFdVrs7Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gahzb7XL;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194CF606A331
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 194CF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Gahzb7XL
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b41188c8b9so4981364a91.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709692; x=1796314492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=cxNCp59fkEXGBW9SQuUTJzcmeRzM5EdI7LagXYagPmGqRzLN4gs+3VH2DsVW8uA9hD
         rlzYJwfEskbm/8+wFg3SV64KRJBFopabW46HJ6YtHv+q521xZeleGpg3TmXA6uyN094p
         WXVLRB7D5/GUFk/7PAZDV84mSf/hMw2gcNaJrMkGOreZyBZxGYhbi6OP1nMsoLvQghKQ
         PIqcPZ+RvaUPpnAQcpr2tPAbnj/wZFpnw0gNRU/ACxOvZXtSpiZZ89JY6k4/lHruR9NX
         c4Dh6r5+mGPkuBgSf2SsNP1uFR2pgOvl+2yUrvQel6vmQ69ICn5CsXqxg11gqqAn3/2D
         EZ1w==
X-Forwarded-Encrypted: i=1; AL+hErHBZiNhCFFbizVFH7CnoO+2PQdL4CY1muVb2lBvCt7pqp7Jl1OPt3AneXfc/lwVbyTOT15QSvveefQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z9Hr8t4ByU2kEjGBcs8YXtnLprTnpvHxqdY1ZNmrIycdmOZjs6J
	YnbmR5m1zoA4G+pEUhl526ermOw1l0+tyf9XpOj1tJ7GWv9WzVXqur5pvvFkClW2QJiXQWl6tK1
	bTsC8udM3yusGyHEfaT+aIX5qILTk7y9eMY+Um6sTA9JBDNrcBNJkcRFfKxJLUkIyseBgevLaPQ
	X+8/kpiDLY+zkP5DLBmvNMMYiRUZdBJHzdaF1p4a9wTWCg+G1lO1SCvamaiuy8HrCuDhprDnY3W
	foMJBz2jh68Ky8hukM=
X-Gm-Gg: AZFdTZevN0D8owssbdYH+qd8Wkw7mkWYbImnILbWeM1Oj48tCF9+jR+c979d0RDAy3v
	8NAwZoBdb0CkpgFWsEyarpI+OxD2vd3VNY1h4+YJ9hZ9UmotwAK/S+3IULqEkR9VBJQLggN9Ogq
	FDfA1Rz3yr33kXjIj0jF2Bxnqt50isPrHindVGHwI9n/UnvvAl/3rrz7dzAeEqfoDNR+Yqimkfi
	2dwmvbRyfXf6cxXaAGi++FEstOd3PAcr8ZY7iH2+rWyezGZtEjo3J10eLUjade60hmWb+MmldHf
	CRFx8NSuge2Vw0XA2HiM7ugE8fzpRR61etsrDAt6u49IK2smz8nbfyGwxEvush4BFSbzR8vdaBl
	hpgc2uqmXSO/xutlExkeYT60sCfvhaCvjlM5fIyFSeQGgONuyZwyCMlO06DAVOkdqw8bXfI12gr
	OmBqJTo27TBoSB18tsG0/eDOIRl0Opl/BNWfD+E5Swgw==
X-Received: by 2002:a17:90b:224e:b0:3b4:f92:ade8 with SMTP id 98e67ed59e1d1-3b41c7e1174mr22089025a91.7.1795709692373;
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm15952523a91.1.2026.11.26.08.14.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:52 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so120234736d6.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709691; x=1796314491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ntCXDO3N3Cu1/Pjjdk+JKckzFffNkRkuwYQ4vI4SN4=;
        b=Gahzb7XL5sj+GY0zrl4bSWVmB/BgiAfFUle/JTblqaALuBtyyBKN108YFReA0jJLH2
         Jhw8bNBD9cRib1xmbARqM+XwgMq1nnML679CUDdakuyvtfjGmBDhO6k9b7VvoYRQqvR7
         jT5tNXjBiWFoTgc6qhcsU8PRUeQ9U+mltPQ/8=
X-Forwarded-Encrypted: i=1; AL+hErHZYwyJSpXNNQhqMYiR4ixckTFpteQSC+gLyDHS0wd7J8enwq2L51JINL3ppKg1+r18XMa5TGJN5oU=@lists.linux.dev
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591430885a.80.1795709691157;
        Thu, 26 Nov 2026 08:14:51 -0800 (PST)
X-Received: by 2002:a05:620a:448e:b0:949:696f:c997 with SMTP id af79cd13be357-949bab480dcmr3591425485a.80.1795709690707;
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:50 -0800 (PST)
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
Subject: Re: [PATCH wireless-next v2 3/6] wifi: brcmfmac: create and remove the AWDL interface
Date: Thu, 26 Nov 2026 17:14:40 +0100
Message-ID: <20261126161444.2484980-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-4-dev@deq.rocks>
References: <20261125190254.176055-4-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:51 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support creates an interface of type AWDL with
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73.

[...]

> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 288 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  51 ++++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  65 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 428 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> new file mode 100644
> index 000000000000..1ef6dd50958f
> --- /dev/null
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
> @@ -0,0 +1,288 @@
> +// SPDX-License-Identifier: GPL-2.0

Missed this in the earlier review round, but all other brcmfmac files are ISC.
I always struggle with the per-file identifiers. If ISC is acceptable for you
please consider changing this here and in awdl.h.

[...]

> +	spin_lock(&awdl->lock);
> +	ether_addr_copy(awdl->mac, mac);
> +	awdl->adding = true;
> +	awdl->abandoned = false;
> +	reinit_completion(&awdl->if_event);
> +	spin_unlock(&awdl->lock);

awdl->abandoned is cleared here. After an add that timed out, the
firmware interface event may still be on its way. If the next add fails
in interface_create (the interface exists) the late event is claimed by
nobody, brcmf_add_if() keeps the ifp with ifidx 2 in iflist and
brcmf_awdl_ifidx_used() blocks every later add, as in v1. Keep
abandoned set here and clear it when brcmf_awdl_if_added() has claimed
an event instead.

[...]

> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	/* The firmware created the interface, its event may still come */
> +	if (!err && !ifp)
> +		awdl->abandoned = true;
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

If the event is handled after wait_for_completion_timeout() expired but
before the spin_lock() above, ifp is set and adding is already cleared.
Then !left makes this return -ETIMEDOUT with awdl->ifp set and no
network device registered, so AWDL_START reports a failure while the
interface is kept. Test !ifp only.

[...]

Regards,
Arend
