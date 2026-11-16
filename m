Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861452;
	b=Zg06CiJENQmcqge1OdaQvQeCVrTSlSkKXCOuJkCCmCylJBTqRNXfuyTcL7M42okjPzYI
	 RrcyIZA4gDyWXN22Nx5nEIwIS2xS+mh+1gmJq7JLbxqPavwEbYR9bGLlgvYdGiJ5DQOZH
	 Jm5Y+4MiQeY7NUn0oVUAQytBfFi3f+Js9lflj1rYD912blogfGY+vsZGrg0YXTaU/rIV/
	 PbiHR98ofafxi1k3TTwqzfIrWVXAGd7jkAdvBadfpCRuYPQLWq0yd9HLYP7IzEqDRg3zL
	 GTBv8MUg4w5HJrfUE0Eef2xD6FBdxiU8tDKr6LIzVE0Now3wKSj5FAEhcoTttw60NdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861452;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
	b=fIV5Aq+slI6jD8JBD3ihLZLQmYv7LLNJrL3LgSFMoqGiVecJ7DAlg5VLhxZvKHuwlXlf
	 hAp/h0lenNUmKs3WsIFRH3QviN0e51BB6LCtmIdBIxqH9S3ipV/zBkjC5CQPMoDytzpn6
	 PCmy4cW8GrcJxcXEHbJNSGVMnHPFUHZV6Lt4+/vpQPVk/LpPvHC7wQp25xmujkc0Y9aoe
	 zGkQG/g1OGK3vSdndBnHV/x1p59z29KjQTRDePVo6txfrIKZRbmKn7CtY4zMs3dkeAhHR
	 vS8ogqZEUy4jkBx0i/UINfvib7bFwQShKlnoIpdAdFQIjWYpnJQ2IQAgdbgNwnvgSPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SH8w7RqE;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3F0606A32F
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 20:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD3F0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SH8w7RqE
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2e977109392so23100315ad.0
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861451; x=1795466251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=Cq+nDVqHt/QnxWNehl+4uXzub7vIVwMr/0aDdXFC8yZHJb+PcxZnLiNGWewI2A489/
         i9gGca1ImxgQ+YqlGJ9JI1uaGi/MuFLpfIC0GLGjvOG/A8Rb01D6XGpUiAcM/v1tqgD5
         1OLAXA2DHLLLpN/E4pyz3jqV7j20EVnGV9Xw0jHbSBU0m49WFMhmSH88YiYr1h7Z59tC
         aqfvWim1+TqPzJ8SbIMYXcZDEbOmwnu6EVBYidIXfJM/1rQtPo91S7XkujgVjUyDOaFL
         FlB7W7JJgexspZqSRZJ08RJGaNvYDdhLw790PA1jaCIebVUKLlSfamDmskrVoMMZPxsE
         P0SA==
X-Forwarded-Encrypted: i=1; AL+hErHib1iL8QqwdD2q0Crt2MSL2s+/jeode3uBPPc4Rg+f2mSmnyAxXeiS7tJH1PxmHEJBemgZTbnqk1o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ANMXJCNg3/DpAfCOxrlPY9As6ocfFATwIKzpn4Bgafk8zDlZ7
	/kJK2DSn6jVL/8ZZrtQiz0ax7iL3JO+YOh7gTjWbI3mK9HaMO9zQqn17Xs3LU4pYXcC/pZKyP+R
	iwO/0BIryowjPjrgWf6KHs27xpFL52S/pRPsAkxhsPze3gQ5H/RxONb5+AP+zzprYlBPfoVv+JW
	Fi9hs90NLyZ4KeY5nFcvssNu2U+h6q3D4rOziA2VUJLO/Pa2/irOObFVMgRqesc0D1AXOhLaG8X
	Z/k3cDki+964Oes1Z336w==
X-Gm-Gg: AZFdTZcf+JSBE7i7kR0bc4bsoN7gHc0KL3pTqre8+Op1P2m3LvdKMnVcI9JD9+Xoj+h
	TUowXMOhglIcKrvkL/HjSZJwfnP1/X7weESv/Jxg+1RU64rISvTqJ63vzDX4ls4K0qmuVUQ4AXs
	NrWGc300c5uVw/wGgx6XFfslkvUNs4QZWLq1qyX6CGOgmmhlhpzwATaYNVvp50SxagEUex1/pLb
	kw5fEfMmQBWYruu71CJDjPhVoAFp/xzMpQv1iIK1/dQ6gPb7j065+ppkz+2BPrFyXdlS/lhHGer
	P72OOxUv+LFMtsyq1aONxW6jckyBv3kVODYQjK/4N92761qaiaoOJ3ObPxd+97k+NYW9xFWw0AO
	DqQRkeQqfQmVuZogoAoTuck7cey4Z+ONvVTjuEZu3EUXkguw24GXYWI3ZgZ69nbJw/6c2otbTX0
	wZ1S0HXPOVG3PsVj1s2yu+jx/2Upruto3dC7m171A=
X-Received: by 2002:a17:902:c951:b0:2ee:2072:41a2 with SMTP id d9443c01a7336-2ee20724b3fmr100026655ad.57.1794861450923;
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2efd7b3f211sm255775ad.49.2026.11.16.12.37.30
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 12:37:30 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36de26cb4b3so4674333eec.1
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 12:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794861449; x=1795466249; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VcYLEFTuS/CxISuzLJytuhqoKhiwpr1cSbsDlYOThBI=;
        b=SH8w7RqEDDygB0SGreCFWBoCzXGQpkjdBDuB9JgSyd1N3PvuHOmd3qTKZPaKSNi8Vp
         zQ1mANNX77xnduDZwpTGS2PyjxxqNUodM0XH7yEsh8hMeqgGlv2t7a7WZ7PcsQfEPUuD
         BdjDFedMZhj2CgGFequVyfl5hXl0rR7mrRy4g=
X-Forwarded-Encrypted: i=1; AL+hErFTQoLE/C2z6wPdc5vLV/9eTpxPxZAmfeIU7DxALBQ8BXmY//Tm9zjssCqPkA8fZneAB82jXLN7kvs=@lists.linux.dev
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797256eec.8.1794861448381;
        Mon, 16 Nov 2026 12:37:28 -0800 (PST)
X-Received: by 2002:a05:7300:e9c5:20b0:361:167c:2364 with SMTP id 5a478bee46e88-37966e3ab7cmr12797223eec.8.1794861447696;
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380d5135221sm1965764eec.24.2026.11.16.12.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:37:27 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH] wifi: brcmfmac: disable TX beamforming on BCM4364
Date: Mon, 16 Nov 2026 21:37:18 +0100
Message-ID: <20261116203719.281605-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151623.70695-1-dev@deq.rocks>
References: <20261104151623.70695-1-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:16:23 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> With "txbf" enabled, the BCM4364 firmware (9.30.514.0.32.5.94, as shipped
> by Apple for the MacBookPro15,1) transmits a single beamformed spatial
> stream (nrate VHT MCS9 NSS1 TXBF) towards a two stream AP. With "txbf"
> cleared it picks two streams (VHT MCS9 NSS2) on its own. The firmware
> enables "txbf" by default, so the driver has to clear it.
>
> [...]
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> @@ -450,8 +451,12 @@ int brcmf_c_preinit_dcmds(struct brcmf_if *ifp)
>  		goto done;
>  	}
>
> -	/* Enable tx beamforming, errors can be ignored (not supported) */
> -	(void)brcmf_fil_iovar_int_set(ifp, "txbf", 1);
> +	/* Enable tx beamforming, errors can be ignored (not supported).
> +	 * BCM4364 firmware enables it by default and then transmits a single
> +	 * beamformed stream instead of two, halving its uplink throughput.
> +	 */
> +	(void)brcmf_fil_iovar_int_set(ifp, "txbf",
> +				      drvr->bus_if->chip != BRCM_CC_4364_CHIP_ID);
>  done:
>  	return err;
>  }

The chip ID check has the same problem as in the ARP/ND offload patch [1]:
the issue is described as specific to the firmware shipped by Apple
(9.30.514.0.32.5.94), but the quirk applies to every BCM4364. Please
restrict it as suggested there.

Also, the comment says "Enable tx beamforming" while the code now
conditionally disables it. Please make the code self-explanatory, e.g. a
local variable or an explicit if (chip == BRCM_CC_4364_CHIP_ID) with the
txbf value spelled out, instead of passing a bool expression as the
iovar value.

Minor: typo "refression" in the commit message, and the subject lacks
the target tree (wireless-next) which wifibot flagged.

Since this is a throughput quirk (not a fix) I would also like to know
whether TX beamforming is functional at all on the BCM4364 or just
mis-selected by rate control, so the commit message can state the actual
root cause.

[1] https://lore.kernel.org/all/20261104151620.70671-1-dev@deq.rocks/

Regards,
Arend
