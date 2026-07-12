Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DED322D792
	for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 22:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895603; cv=none; b=AS2aIFC7kd0i/IfEE8pfutcPIki6lGe/ZgLNj2eEmu2VotLdVpRRSXcPZyfDZ3vTRUScaXvopBuXqOTLTgenRsnAzSiTV8x9pDqw0AX+jHE7b2xSeR8+lPNcgFDxw8ekPUifftyBkjxFwXT4fkVDIjA19v2mdxXEXROL28Ib3cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895603; c=relaxed/simple;
	bh=9eV6FVRBj0+rcygV/638gCn4ARxyqwVGy0pBnruSIEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNTa1SrYnFz1mDJy0YLw19CuPK51Zki6zGN4xRMkNNg1siMTbHF0EdNWqu4+HsU4GWhwtlz31Fr3aigp/62i0o8EileElNQXhdNJA+dB+CVCvs22c9fmEbm0KvahYajJ3GDean5AgfGrl6BoInl5EwQzy3JueO3+s13y3B/Z3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bN5U4J4V; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bN5U4J4V"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2cca0c5799eso25313515ad.0
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895601; x=1784500401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=as9uoNChv4bOT2fKEipNolL6IX5VF1WJ1fVqwJJ/Tbk=;
        b=o0d1/3EH4MWb3Eu1/17kKoee4UJ7elkbpMUWdwzRHJWk6ADDjsQobne4nSH6ZLQ/bY
         mCU2UrgkIhp8BZfJoZX2azH3VMFdmjZPHl7wUCoiaVTkGV2ioJdsIOFxhzbf02O//P4o
         Rp14J/wZxgVbc1kbgpY517pznYlEIeVxBHNDuCeu1L7OTW3biHB5ocU74AGnQXSZsNhm
         36jpzyQR5d7zr1i9+7D9mmgTfO5O+VGo9TW6Hyi507NHDyZWibRDO8vfpkVW2bwnPKsg
         SiCW1vGvcariCRDsSqvQKBqmNCZChHNz3uxC7QB/TWNa/NKiJxygrgAhqsBo2klNF7+r
         LGlQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8Y36XST4I8+VMvhE+g6Qj3DCTQnRYZ6PAgtpfydEfoY965ItsdoZjOcvBmp34+Edq9qBNnpgg5sk=@lists.linux.dev
X-Gm-Message-State: AOJu0YztYgyO5GWs2hJDW2nNeuxBXGvVcq1/U1U08ZkCA3biR4CP/sTI
	Bkt/r2d5Gh+/VWsZ7+Id9wyYkat26349AVYrXF7YOkWVaDiqRRCipYlvpFLzDNb58+sj9kSCb3C
	2GfYdkuLz1vx441no0DQy0W6NsOtYOUGWqIekwKdIQchhju5dOdIw+/A1GMRGZVGpjwTDPe3CVX
	PTzwZ2ixW91hhLVRxSqrqu6/GMUJwpo9pqoLsEUvnXR3FwILyJDO9JbCdaUr3WW4p25JbzynFbY
	RHrhO3jZzI5ClAEgHrxtw==
X-Gm-Gg: AfdE7cmsk90HiU1Lks/y6HrVHQhmbHun7AG8aJGMLq2pzbDS3mBfFFhZepoyXQw0Ga2
	w33xH8ZJZ1EFXVHEP3t92UzYNRl1wGZOSk5RF2Whlgc/AlS3FM1zL6LvsJYUkqYNsRvpl+XirQc
	Y8aaMd9GGAac0N+jgZQxCAlGfnJi4589OqoOUk47f8dzQqztfmbyznB4uGI9BC5qH73fuBTFLPI
	tettc7l+P/Ztp7lQQifQIXIlY59AxklmmnmpMuKELeKQhCGsXnS3yI7kYnfbbDgfMdjNx4Pkm4T
	WfZvkc9QN+CjPWvOFWUR4GLTM2JE6nt98lOrMdt1dEYMyZAaXTeYOPI1XiymuvlN/wOLRKIBAt/
	8qmu//w8P8QD5Gd6rRBIrmrNdOAij5zk//TVMdzaq3GpYSTybg/KSv9ieNSx6orKH0ChzrN60I7
	fhFNDwsQ1aNYW+1hoynw4fYfDIe9bwKqnU1gGm+h4jFNA/LVF7qJod
X-Received: by 2002:a17:902:c946:b0:2c9:97a8:aff0 with SMTP id d9443c01a7336-2ce9f3d32f3mr61774115ad.41.1783895601401;
        Sun, 12 Jul 2026 15:33:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc9bde037sm17682095ad.18.2026.07.12.15.33.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jul 2026 15:33:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dc4401dc7so1724164a91.2
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783895599; x=1784500399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=as9uoNChv4bOT2fKEipNolL6IX5VF1WJ1fVqwJJ/Tbk=;
        b=bN5U4J4VPPLni506nwXHXkkN2B6lTHazV/E/30DnWHxw8ODXJ4LGGUa94MnNbYXPcL
         lUPlowBTJWhXIVYv1MUbw18jDa2J21CotObwbfeXQU9rBLMxTRroIceqhjDesowKXDmg
         bSM6gYyUSvUNhVtCQ3yWHC/G+02XMFXuxNkPU=
X-Forwarded-Encrypted: i=1; AHgh+RqoRuakkbJmftlq66FN9SQwmVU3JWGhtj2KuhMW4G0ecWRQY59RPWwMAJna/aldWS5+kDzm/lXQnJM=@lists.linux.dev
X-Received: by 2002:a17:90b:2b43:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38dc7a494a6mr7053682a91.14.1783895599479;
        Sun, 12 Jul 2026 15:33:19 -0700 (PDT)
X-Received: by 2002:a17:90b:2b43:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38dc7a494a6mr7053673a91.14.1783895599053;
        Sun, 12 Jul 2026 15:33:19 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3120c8e41fcsm30681627eec.15.2026.07.12.15.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:33:18 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: arend.vanspriel@broadcom.com,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	Kurt Lee <kurt.lee@cypress.com>
Subject: Re: [PATCH v4] wifi: brcmfmac: add DPP support
Date: Mon, 13 Jul 2026 00:33:14 +0200
Message-ID: <20260712223314.2182929-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708071230.312836-1-Jason.Huang2@infineon.com>
References: <20260708071230.312836-1-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 8 Jul 2026 15:12:30 +0800, Jason Huang wrote:
> Add DPP AKM handling and RSN parsing support. Map DPP to the
> firmware wpa_auth value and recognize DPP public action frames in the
> P2P action-frame TX path.

[...]

> +	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif &&
>  	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif->saved_ie.probe_req_ie_len) {

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 151 ++++++++++--------
>  .../broadcom/brcm80211/brcmfmac/p2p.c         |  59 +++++--
>  .../broadcom/brcm80211/include/brcmu_wifi.h   |   2 +

In the v2 review I asked to split the P2P device vif bug fix into a
separate patch with a Fixes: tag for stable backport. The null guard and
the fallback vif in brcmf_p2p_abort_action_frame() are both pre-existing
P2P bugs that should be split out and submitted as a standalone patch so
they can be backported to stable independently of the DPP feature.

Please also add a changelog below the --- line describing what changed
since v3.

Note that the P2P device vif fixes are pre-existing bugs that need to go
to the wireless tree for stable backport, separate from the DPP feature
which targets wireless-next.

Regards,
Arend
