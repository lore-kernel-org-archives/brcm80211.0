Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A08399D00
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 10:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785666330; cv=none; b=VGrpedmcXToMlxeczEVQZZgMkvRn/hncg9GUZB7qTXSmtwWACfGKvW/gIu7lzJz0ZqeffBOpVnLOClWanSmHJnb5woI1L9zhSODMo7RTrNLJk/fvTnd2ZRbQViJxTgO3umgp0XGBI6zp8NGVUZ147WT8YCiBpFxw+kz1u01SXNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785666330; c=relaxed/simple;
	bh=pck+pClOKblcqDWxsPRoWg8rfy6K+Grrr1EREHE3oKM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=sbcQ2q7hD3R6iScaZXbbac4SxyhfbF8xKaetB8t7z40hptO2lO7V+TBT/6weMzO6aglvYnJBXoi6ZOI50nDLl1fVtaOzYc6i01gbyTxGaHciX3peGrFSWeu2BnxyBDa9XvZVhbUAC0PIgkDJbDGgrXqb/tvf4vrT0OpfENfVkWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XtMkATTF; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XtMkATTF"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7ee125ec926so1698525a34.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 03:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785666319; x=1786271119;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U30tOpuVn8qhXLPjIH2/nfOt+KCdmSRNh2hKzUS0a7U=;
        b=VEbBiRkXy9whMJv/CfrvIpzvCkhoT8u5rBQ5YyVMctCRRzSiaBQtTUfi+MUo5wenY0
         IDLNu5z8zU3oygO/M9Q8KQ1kN0AuxkPyjkTvQ1TCEn9qx9bOyPnTEK2/rrOSwdLdys1j
         jbE6ZDDkqImReTWHCet7JHq1d3yB4OFEZ8hzvgea7d760jt2pPhs1jhVLEvX/gjCftgb
         ri36hDUWgDad9enMlWI+Zrs5XV8chBAiaOflPF5MpIHNjzPKsv6cpexqISaK4PoAPNv/
         8HYwnFkOKushH6zvxKE00IEK9QFxiultQGGYBMR85DV54E25RftKRT26JfKfF3mLZGLq
         +cCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoG0Hdy3LRLq0C0EIqFj939L0LSkD/PyKlXIBPf359IP04DYYkMGGVYy1nRj99DsVigwueJezrWotg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzpB9fTeG6nQTYZLSoAhAel+PNiHTFxONuNwHbj3LSfv3fwU5+I
	MaTgGgdNpF0Coy7efHH7QJ4H16VfK/JghNOaiIksxY3tsGSB8ddSwbcCWDvL05wYk7yWNVse05Q
	0YyDDfCn3L6nPkJN3ecAzYJIQsPyno5yM9K+RsljnVyAnIkacoAxAT7M/QZ6l0nx3Ra1JsJ/tT4
	5HOT12NuMeNalPOI8C0fov9JJSL2JkGhZ5IaIOXIvqdbiVR5Qa4bkBtoTMNY917LNtUPfFboXv+
	BsaYz+ATw2bO+ekO0N0qw==
X-Gm-Gg: AR+sD12wF148yOnVh2HaIglvcjPwcmkLh9J7QRleMR4RSIc5m7HHZK/2hilwFGKEY5n
	gQ3gwj+B7wuuYN/nZOnKtssDhG1txSa0GS9VW6KnQ5JdZ4mmSDTPl5aP9QiXuwuFoA/ZPUlMnMq
	kIpGo1g6lxOIGfTKbS1vGh+vLijXw5XWh3BhME7iuFblmePyL+gRInKNy4Kx69XD9+My8lMT059
	mWeVDKQk4bMdL9oIAJM/w22qK4cdUJsVzp0v+yv2dr2TOvY7YxLugIZt1FiF31mxLP3Bo9Z1wIK
	aaxn3A17k2TufVZXeZOOgMhiGnME63GUJtOdFg6ngtjCFyatzHZrHy1E69guuInMqWrPGiYQfKl
	7n3xi6xmXPsHhq7p8qF919ij7uL5e2DF4UxTEFKwtHzl7kSxgfjCRNv3d4YJXmJZufOhd7TpeLT
	ddmq75bcSLZdxS0WqvNVsfroRr8Ga6sRYk8+HrFvo=
X-Received: by 2002:a05:6830:608d:b0:7e6:d0ad:5254 with SMTP id 46e09a7af769-7f196d33de0mr11334418a34.8.1785666319495;
        Sun, 02 Aug 2026 03:25:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f18ed3259csm418276a34.1.2026.08.02.03.25.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:25:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so3708245a12.3
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 03:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785666317; x=1786271117; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U30tOpuVn8qhXLPjIH2/nfOt+KCdmSRNh2hKzUS0a7U=;
        b=XtMkATTFOUam/08L17QLbD2AuxOnUqeNX67hCoCMA8F6u5hEt3AeS4Bsca8piXPRoU
         s8N4448e0P4O9x2kXAw2hWSv3NwbCeaammn1LCe0Wq4o+SZpeV/Jiif1rLpZXHp3e4Vc
         FHQcqWHsyJZD0vBafiwLUoh7r0y/+UkPE2qyM=
X-Forwarded-Encrypted: i=1; AHgh+RqOhVyANsFRHwRbLP9n8GDofrE00GHa/0OACL8p+JjH613I31CmlkJ/6IxVvo0FLYwL58mAFLHlroM=@lists.linux.dev
X-Received: by 2002:a05:6a21:3a4a:b0:3c4:14a3:fed4 with SMTP id adf61e73a8af0-3c92a8f5e7fmr6805478637.55.1785666317001;
        Sun, 02 Aug 2026 03:25:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a4a:b0:3c4:14a3:fed4 with SMTP id adf61e73a8af0-3c92a8f5e7fmr6805451637.55.1785666316514;
        Sun, 02 Aug 2026 03:25:16 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm22570319c88.1.2026.08.02.03.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:25:15 -0700 (PDT)
Message-ID: <d5b7a4a8-532f-47c7-a883-036d5cc81a90@broadcom.com>
Date: Sun, 2 Aug 2026 12:25:09 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] wifi: brcm80211: performance and stability fixes
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shivesh <chanelshivesh@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
 <20260802101530.4028803-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
In-Reply-To: <20260802101530.4028803-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/08/2026 12:15, Arend van Spriel wrote:
> On Fri, 31 Jul 2026 16:06:17 +0000, Shivesh <chanelshivesh@gmail.com> wrote:
>> This series fixes several performance bottlenecks and correctness
>> issues in both brcmfmac (PCIe/SDIO) and brcmsmac drivers.
> 
> Two blockers need to be fixed before any of this can be applied:
> 
> - 2/8: num++ was dropped from the subframe-parse loop. cnt is always 0
>    on return, so rd->seq_num += cnt - 1 underflows to 255 (u8) on every
>    successful glom receive, corrupting sequence-number tracking for all
>    subsequent packets.
> 
> - 4/8: pmksa->fils_cache_id does not exist in struct cfg80211_pmksa;
>    the correct field name is cache_id so this does not compile.
> 
> Beyond the blockers, please split the series into separate submissions:
> 1. Stability and correctness fixes (3/8, 5/8 TX-stall fix, 6/8 Fixes
>     tagged part)
> 2. Performance improvements (1/8, 2/8, 5/8, 6/8 performance parts)
> 3. New functionality and comment-only patches (4/8 PMKID_V2,7/8, 8/8)
> 
> This makes it easier dealing with fixes that should go to stable trees.
> For the stability series you can add Cc: stable@vger.kernel.org and a
> Fixes: tag in the commit message.
> 
> Regarding patch 1/8: the patch also fixes a race where a ring state
> changes RING_OPEN->RING_CLOSING while blocked causes a permanent
> netif queue stop. The fix relies on the atomic counter so keeping them
> together is fine, but this change is primarily a potential bug fix so
> rephrase the subject, e.g. "fix blocked-ring race permanently stopping queue"
> 
> Finally, some of the commit messages seem to use LLM lingo so if there
> was a coding assistent used please add an Assisted-by tag as required by
> Documentation/process/coding-assistants.rst.

Some additional remarks. Have these patches all been tested and if so 
please add reference to the platform used. Especially for the 
performance improvements it would also be good to have some profiling 
information as to how much performance gain these patches provide.

Regards,
Arend
