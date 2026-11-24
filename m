Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551231;
	b=Q/+1a1MOkwe9Rb5rDgU6lSyMdFhkm9PypTntcl5Lvx4gd75KHJ04ueuQCBXP0MxNOXZu
	 hZVcwXkvUJt1f6pNSXbNLJdX7VXye5pyZ3ituTDSP6FBdmO/UMHAbgbP0PIBzQKRNGtS4
	 eDwM6St8w3QQvMNiLSuFMM5G5EeA81qxG5dwVOK/8YTpXQGqwKezZAG5cDdorDIBKBdKX
	 85vwGcsaTt746bRs0OfHApe8I7IsQiORfVNaHg5R9A+OenmTe+R5Vjd5VmR9g64x8TRYE
	 ypppDiafis94CiNaBPiNjyVVYgJ11mdvMu5G0khd2RtK2Xw3tUwlV0tGBOmWcus8d5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551231;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
	b=m+M+8MibO8ZsGUeqVDMyH6W9KVsxL2Lu0hx3Aq7HEEC96h/Z6PM4wjOYnZ+73xXN/C2l
	 XKONFCEsdQ+iaX7CZH+YXZUVuPNYJE+zS4NQidUWT8nSS9KuVXjr6NldlotItG8br7c0m
	 ik1yjEsEpD42bw0eYTvoSGvWzoGubHvVwYP4nCbbnTbWUeoL2JYUAKHuG1rxDbwi5VrDj
	 xp8fgL6g1Ffio7M6VjzIhRvcICyEmchgRB3tPTrzpXX+Jz0Qk+ETmZ5nkFH5Uuh7WwMkL
	 RAPY2kI3etqrh7UIjlyDf5U8Cc9fZcsSo5S/oeq18MEibcFyPgme7IGKqeCnppUuasQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Az6k7SEC;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DDA606A684
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52DDA606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Az6k7SEC
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-38699cf08dfso5574626eec.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551230; x=1796156030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=ZrQIp2Tw8LUHGnAKCGuMhFx0EsdFvV75+HIdDd3PzJdJzAUvPyr2VbrFYUW/teA0nZ
         9GYgoeTYDTSppq/8qZ3JlBtSg15LYv9PUGeRULpne86As6+Huw/wUHtzybfnx/Z3lCjx
         nvtjFWBntHqloF7nq6Pjs++ZrzGxswZn5G4/jqg9mFTfbe2gEcIET0MvKC1ayIAm2KAJ
         cE3nmhB7NdhOzMreGh+w75tyiKKWHLsM3ZAcNJjwhurfBVHH8D6q54g70gIoMn1SuMXn
         KAt9DUL/Lhy34KEaZCNBG3IXEaIbiClj8ihPZkJPb8qVVsug5fF0rd5TQWIVwEg55uUy
         x8Yg==
X-Forwarded-Encrypted: i=1; AL+hErESe2K4kMtjCe2isG2dVpfLlxThKQH1SXOSS7aOl/sukG1Tz5aAFFDnwR+MHR2PbHXM606/Svflcms=@lists.linux.dev
X-Gm-Message-State: APuU4Z9o+cmTwgt+O9UlgIKdlIQD29Hd4Gdu3nI/ud5EnzXOq1T5IqT6
	K7yQobHc8cZCX8NETA8m1p8H+1xn/+4HPI23JY8J0NQDZp77SAim1n9IZ1+KS/fdzH1/BcsAzYD
	l3yMzKOdmVIL/wzKMz09ylCVjAbGrKw1gKFx9CeToOXKtoBBNcPH+FTaGSuxRS+Xkt4+2GTOoAS
	MIz1v49Kpo/HwU0iTsCsltDiT/uUQHRpRoxGF7aAUQvHHKr0mb7uEuiuum1WDap/tdT05IW6G0d
	moaFH4XHBT8usHv9b2Ilw==
X-Gm-Gg: AZFdTZfo0gpkA55FqPLPYWDT1ZqVRUMfb7RQE6u5K8T+YkRLzVr7aZL4QsvujI2+mL1
	ejQ4CyyvZOs2OHfyvu0sxm4Zb8xibv/tRmiTy3qBFONCCVVIuDGWX5kU5OuOUwOXRaf3JYL1Iir
	VPWLmK011n+sQRsePtDtbVfmvhRrDcYGZu5Lqs7hBAcM56LAJ2j+JZUJMQvAQn3JurHpwgnOMlD
	cN5dEZ2frSba5bAbCGkCOqoa924lEuFllxqP9PvZp1iY+MLVthq8w+vbJwEzVOoQ7C4YM+y+Rh9
	0JPqpbeuEwhy3QyHdC++EBJ5ODqZckvzQjaUCo53vaDZVKVyG7EiC7FR/1zMVRYtpfCJMz/2OLI
	HJ0EoqPcPWhBvzfvomCBjgwKpWMDV8VjNd/kGBF4OvUktmkYc3m2mmE9A8oPezhGAq4kmUBJ+nt
	/5CXl2bVgnDZg0T4/sl4rkgnWuPVkVKfSEgdQWGVQ=
X-Received: by 2002:a05:693c:880e:20b0:386:b26b:d67a with SMTP id 5a478bee46e88-386b26be80fmr6744864eec.12.1795551230104;
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3856466a05asm2269213eec.3.2026.11.24.12.13.49
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:50 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc3a482af7so3563340137.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551228; x=1796156028; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rlWIHX9NSm3ZvbB1YngE7yXcr1uevNuXKUdmXs9oPKQ=;
        b=Az6k7SECBuPlmXzA9Xe1bPRPoEyNCXU3sEok9vXdcKRioO0hCvLop3qI+axljujIS+
         CN3n2ZivxBZ0VimB+EMEEMa1BsiBAEhodYTzZqu5uskziLG1KNO7uk8TC/emd38WmIim
         rLVxwKQ5w2pifOgE7IGX1HFnD+jUCUasAPxZ0=
X-Forwarded-Encrypted: i=1; AL+hErH2MQZQ22wJK29dLds6lt/FZZxCGkJHLHQJzIO/PSme2ozVuY07lYd8NkULawPB5bkpdZ2OZCq98JY=@lists.linux.dev
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708534137.36.1795551228581;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
X-Received: by 2002:a05:6102:f97:b0:7cc:226a:f977 with SMTP id ada2fe7eead31-7d7396157a3mr7708490137.36.1795551228151;
        Tue, 24 Nov 2026 12:13:48 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm140905426d6.1.2026.11.24.12.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:47 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Tue, 24 Nov 2026 21:13:43 +0100
Message-ID: <20261124201344.3494326-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261115185843.64633-2-maoyixie.tju@gmail.com>
References: <20261115185843.64633-2-maoyixie.tju@gmail.com>
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

On Mon, 16 Nov 2026 02:58:42 +0800, Maoyi Xie <maoyixie.tju@gmail.com> wrote:
> brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
> starts. It then uses the indices of each frame without a check.
>
> 	rfi->pktslots[rfi->cur_idx] = pkt;
>
> A cur_idx above the allocated maximum makes the driver write and read
> past pktslots[]. An exp_idx above max_idx makes
> brcmf_rxreorder_get_skb_list() read past the array or loop forever.
>
> Store the allocated maximum in the flow. Bound max_idx by it and the
> other indices by max_idx. Deliver a frame that fails the check without
> reordering.
>
> This was found with a static analysis tool that we develop. A userspace
> harness that compiles the fwsignal.c functions unchanged runs under
> AddressSanitizer. It shows the out-of-bounds accesses and the endless
> loop before this patch, but not after it. No hardware was available for
> testing.
>
> Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
>  .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
>  2 files changed, 23 insertions(+), 3 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
