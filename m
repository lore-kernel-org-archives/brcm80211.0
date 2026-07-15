Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7076342D76B
	for <brcm80211@lists.linux.dev>; Wed, 15 Jul 2026 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141223; cv=none; b=TlCYrR1j50xYxpNSGdfGZJnLxeO6I/4GWNDSosnKjSqbRZr0KVA1gHUfJNmPNUMUAQaM5nL68FIuF9F+RKEdNSEjQ78jtZM3r130eEn+ru6FdS+LIvRSUsygeuIVZnMa4kK0SIaRWKLEyXamcbAVe0E5LKJWt3DZamceBlJhJis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141223; c=relaxed/simple;
	bh=pSGfxDBu/bTKUCbXwEE12hQsnPigII/3rhV06KMBMj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VeYL5WUXakJyOADYMAlTpG6tjkdJnfMiWxhGuF0t9Cgz5ttc/NiK723f0e0V7zvEEhzXdxMVrElk6XsVjCkKiy2eoLe5OklsduRfaXczmPBk4pgFF+dr7TZBN5VQboUJfWwYAaYsmJRGV19I2gfTeuNaUSQdUwgWG4Dn6tKMdzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZCX8xIaC; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZCX8xIaC"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so97125495ad.2
        for <brcm80211@lists.linux.dev>; Wed, 15 Jul 2026 11:46:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784141210; x=1784746010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=b+JMc1wO40ou3EWMyWhSvMrcBgYYX5J3x/eL2eHwCT4=;
        b=VdhSCIHp+/ljom4kGW/y6VPr4lQk5Vpq1qG/lAcJXqK77cx6161M7Lm3Al4u3tmtLY
         VDlsEO8/VfX4P6QCzJtO/Tz1PDE0GA/YoNtUsyEWwLL7pwiDvpc+D3in0X9NVAW5Iia3
         OJJ1laPMVvLNZmLsOgMtuUH2N60COG3UswgK79XS1FkodD7R9WZgBihJACczvpgaqI7z
         fV1vL5JxCeg+bFzjylOaaTvwbFdwOMLKFqZ2cN1uJULRtgZSkpZBW0FnQcoKa/hJerCF
         v2BLRf2owsWB57wTKUTC7faaCqerZx4g+VNMB82D8AvAXHXj4SHs92uBd3nfVyaoEqwa
         Sv3w==
X-Forwarded-Encrypted: i=1; AHgh+RrYwtXAdBc7oF4Jx4/JYWEpMSkeAU7Tf0CcuiwK4J0R+esO2nU9m4VzFGzFrn++Y/8Hil9Mc7gv5FM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0LaeibjTuphKz/URTfevwG4eKKsuk47sWekyeab1DFtOzciXR
	m48Ij5w4q3Iop/W5LigZlANPA1Cj7ISvk22sj6B8W+xMSWBXd8K8yiME/xZRGese+5fK8142Peb
	DIpDCg67t+rJkfFD04aOlC8W7kqkivp1xj4VNIXOoOp6L3wA4/hid0VXEJ9kYUFLh9D94amW+r3
	uaQxNwKdIfsUoPDj97bjz91+GxqP5JyFu+eW/+4NMC5GRdfQ2bwwujtn9/5RlFNaB1jgKbpalS2
	xaGIbejievxz+40q6p2/A==
X-Gm-Gg: AfdE7cnkgkxyxYvFh9pEioIshd6amMB5D1oozQmc377/OH1Z8SnO0Zw5luOA5RyZFLv
	mjPYYcLrtHYhXsG2ijbXImyd4/E5+X8jtjH4RFso+vXpwQnlunZ1efnybsUZtXoUWRsch6iuTkZ
	3K1UG0pUSPzpwKEBaC/L+WJsIlHuSCpAjGb8xmpx8UvSHw443WiGS+tWNJoPSJYG2KJqwXfRO7T
	IsjNJmAYbdI5U+cLt1UPF8yGFlHeSJ2SPYS/9VsZkH9XwZ8vem/TaUNsxlOtjwMHCmUv3W8f1pK
	vKrVcIEOAcitBV6ZKp/kgGLWRoBRhFCQl4xrVxv3IOqonx3/NHvknzyArXHRFi2JeL+YtWXKUcX
	WrpeIm04kDTZHkKVpHwH+x9QiYEqMh6d3TOK+0MnRlJ2gyrM/Zkh9YCzbaIGFn2LvDD9oRNgo7/
	ufATq4BX+S2fEZRUlHR081eYjDrIp9ryV8tRV9nLAMvp1iLV8=
X-Received: by 2002:a17:902:cec9:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2cef10f538bmr77796745ad.0.1784141209661;
        Wed, 15 Jul 2026 11:46:49 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-0.dlp.protect.broadcom.com. [144.49.247.0])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cf102e7466sm1200665ad.33.2026.07.15.11.46.49
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:46:49 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38869800848so8902745a91.0
        for <brcm80211@lists.linux.dev>; Wed, 15 Jul 2026 11:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784141207; x=1784746007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b+JMc1wO40ou3EWMyWhSvMrcBgYYX5J3x/eL2eHwCT4=;
        b=ZCX8xIaCw8zXwUaPoIRqlYhwCNp72MAhRDDp8op/nmRaE5gzoOEFmjbBP8cKpIoEli
         1NG1Zy/aDmEaP4Qvh/n4xM8VwR/bQZAFlUIEewj+oVAT9FkH11LlF1CxSzY99bTAPc08
         YS0acS7iHVE0QSgvg7nPrpz8E8eGIvDkFJYFg=
X-Forwarded-Encrypted: i=1; AHgh+RpRznCgGuAQ2lGDO6GtASZZEDpZDLBv4+8+E4Hx8FLZBfz+9+2vgL9TFrR1BYWHDqj+vAjefyaYS2A=@lists.linux.dev
X-Received: by 2002:a17:90b:4cc5:b0:38e:2524:7272 with SMTP id 98e67ed59e1d1-38e25247950mr4460084a91.39.1784141207579;
        Wed, 15 Jul 2026 11:46:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc5:b0:38e:2524:7272 with SMTP id 98e67ed59e1d1-38e25247950mr4460056a91.39.1784141206995;
        Wed, 15 Jul 2026 11:46:46 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e538368sm5941438eec.12.2026.07.15.11.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 11:46:46 -0700 (PDT)
Message-ID: <8c4d66db-b7cd-4fdc-90f8-b22e4b571179@broadcom.com>
Date: Wed, 15 Jul 2026 20:46:44 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: brcmfmac: add DPP support
To: HungTsung Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>
References: <20260708071230.312836-1-Jason.Huang2@infineon.com>
 <20260712223314.2182929-1-arend.vanspriel@broadcom.com>
 <20260715092229.GA667683@ISCN5CG5251XQT.infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260715092229.GA667683@ISCN5CG5251XQT.infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 15/07/2026 11:22, HungTsung Huang wrote:
> Hi Arend,
> 
> Thanks for the clarification.
> 
> Could you please confirm whether it is OK to submit the standalone P2P fix
> to wireless in parallel to wireless-next origin/main? My understanding is
> that the P2P fix does not need to wait for the DPP support patch to be
> accepted, since it fixes pre-existing bugs and the DPP patch no longer
> depends on it.

Yes. You can submit the P2P fix in parallel. I am not sure if 
wireless-next is rebased against wireless in a release cycle. Maybe this 
kind of scenario is a reason to do so.

> The reason I added:
>>> +         p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif &&
>>>            p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif->saved_ie.probe_req_ie_len) {
> 
> was that DPP public action frames can be sent through the primary interface
> without a P2P device vif being created. The existing peer channel search path
> assumed the P2P device vif was always available before accessing saved
> Probe Request IEs, which could dereference a NULL vif in that case. However,
> I agree this is a pre-existing P2P bug rather than part of DPP support, so I
> moved it into the standalone P2P fix patch.
Thanks.

Regards,
Arend
