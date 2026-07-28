Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D215042BC5F
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 18:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785263002; cv=none; b=SD3xzmmTrnu+XABsYYnTj+LzLrQ3QUCngn5gQxXZ+AMF88FiwEC27a7qiSRtLAj9iBvAt7Gi+4OCYRNh1qQc6OZ+L4AwacA1y+R/ilrPBLA//jOPpTWLWkI1ufut3LxnbMLTyTMv1s2Q3uextpSXC+Ts5ktAydaXRcgVT/9ApQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785263002; c=relaxed/simple;
	bh=2ZMnfh2gm+z7DwlJzwXN+9iisoM++fsRSpgPAXHMX9o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LzyhDCMFVXglmQSsPcJjrgAQYX7i/C8TTHdC1m3elypIujqgfOrhiHqXaRDMW/0T09x0G245M34Bw2V1NwzyQX7YDR+YbcNwoyWFWReL+P6aOuRk5SJsZyBE1laGveaO67VUodFthk1M/o1VzWkY/RRmom0aqmkeLMLC8RiwxIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U8uqpyTz; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U8uqpyTz"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-74ab99038afso53128137.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 11:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785263000; x=1785867800;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o/vhj2pW8AaAC+A8m3nnuIMt5Yp3qwZU9C2fvtKyLjE=;
        b=DYcq9oGuXUshFlWd6u5MWEhzTyU8BPjB+pm/6R3F3hyWas/R8lilcukfVfFnIycjfN
         mjUovtqNPwyDgqWMizhVXGlEMBnMXPqvRzCNeCxWx0DigTa5XgIok81braIiOaFXaMQJ
         Ji7cdL+7VLmvDuvXRsVfX5PKS3nCFXLgWUHOBqJE0pYzLkXPsgigawYaDN3Dxv8ubf7r
         V3tkxnNUuH3uJ/xXlLVHd6WMHZp/3gpuLBZFL+OeJVwNiojMqn2AA+KUGJNxLBG1FPuL
         Cqr+FJJL6cirmht4jh/sEeR7u5GTmLTtsqP3SuUNWSDncOvsTCbaoTuRYQQFLOdojHxm
         xLsw==
X-Forwarded-Encrypted: i=1; AHgh+RpgyMXgZyERSKsakVKgqh0/Q4CDsHEZd2p9/wZdlWI6bl+IcN3F91/yBaY7JzpJ9rdJypLMlAugLd8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNvwuSXYupEty1ZEfdfFA3Y91mqhtyiHTavBLKUHanmHSazMN6
	/+zCM/BI6ZIZGl68csklBg+T3LSkWNOk/Iixw4KfFQbFr3LlMg4ha3fhese/O71SFEehJtxW+Wr
	xDZfGBfgV+3//EUficYXr9ldxRKvPGCSSj4Llvf/cvmfE22dGxV68EeTObhhRa2lzZy3/uvFwxN
	A5rJct33iyQdA6gCUPI/rxktQ52NDZOthvS8mhu/WIMC/88unJlVlQts5l2Fi7uRXnoM33KznPO
	f3Hrxw9UWOtZWVGQvdp+w==
X-Gm-Gg: AR+sD104sv4jHdvpqb+G7BpbdnkiuWXXECDa362lq5YdCqBStbHTze347ojsYw24/sV
	srft766NYVjqTs/TmT+YlqK8XVDeFYGftRlUzbCXmbdF7crSHUYkH2UA1P8BT06nVve7ukw/JCC
	HQ1J8xZm4c28cMYZ1Ew8HBu3zvo9areLRbjKxYGKwtdckdY/NRLPXG3zCJzERTAbjhoRD8IeoSc
	vj1fPD0QEKCUN67iIWk30bHkaPHpDygMkbtl1yBupHD9ssw48rUzBcCa4aXNeJCPN+dNNaltapV
	5Lgu2p8/lg1vcaU2t/ALKaYebXl1e9sNP3UhVHkz+iRX/IB9J/txZ3W/kE4csK48DCne3wmR9sF
	zIzoSEDmplwjfvexSEfpH1rVs7BDFnomOpHkUfHUFwCLg/owS/ZPUcxJISkGFpGgs4O5sqvcK3k
	8GjK5pKWufWWKAC76hlhrog5INI1rtT8iDhNMtRbE=
X-Received: by 2002:a05:6102:808d:b0:737:d16d:9566 with SMTP id ada2fe7eead31-754a27c8052mr1814949137.23.1785262999630;
        Tue, 28 Jul 2026 11:23:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-755a4871c52sm10753137.0.2026.07.28.11.23.19
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:23:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e667368f0so179020a91.2
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 11:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785262998; x=1785867798; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o/vhj2pW8AaAC+A8m3nnuIMt5Yp3qwZU9C2fvtKyLjE=;
        b=U8uqpyTziUdrXm+0XYutr2s3KiWpR2hS/8UGNq1Mxr1ZM0Fx6BSCAeYfglPbImtulA
         q+O2qsLZsaXRJo5vmrnfb0yLwzqe/jrIqSaHmaP9QkzzpjP1Xq1pJjiRA3aDbrfh8zFQ
         Uxe4Bk4e1BhAg/Pff3kWyHbD13e86ltInNUuw=
X-Forwarded-Encrypted: i=1; AHgh+RrU1AD+VL7VDfTV0uHkDDj3l6wgy8TByRbFESAvweBWNERXKv4VSmwdJqIf0RVBhqzqSoim8UQVdHo=@lists.linux.dev
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr3757868a91.36.1785262998448;
        Tue, 28 Jul 2026 11:23:18 -0700 (PDT)
X-Received: by 2002:a17:90b:50c3:b0:38e:408:9d7d with SMTP id 98e67ed59e1d1-38f6a4acbe5mr3757815a91.36.1785262997482;
        Tue, 28 Jul 2026 11:23:17 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504dd42a9sm1193748eec.30.2026.07.28.11.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:23:16 -0700 (PDT)
Message-ID: <2f901fed-faed-48a1-8f98-d2252576394f@broadcom.com>
Date: Tue, 28 Jul 2026 20:23:17 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v2 00/12] wifi: cfg80211: consolidate cookie
 assignment for async ops
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
 <03bb72fdab133a4efa84bd57cad966d222fadb73.camel@sipsolutions.net>
 <19fa998cfc0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Language: en-US
In-Reply-To: <19fa998cfc0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 28/07/2026 18:39, Arend van Spriel wrote:
> Op 28 juli 2026 18:18:48 schreef Johannes Berg <johannes@sipsolutions.net>:
> 
>> Hmm. Maybe it's not too hard to update the staging driver?
>>
>> https://netdev-ctrl.bots.linux.dev/logs/build- 
>> wireless/1136007/14715755/build_32bit/summary
> 
> Dunno. I didn't look in staging. Will dive in.
Indeed not too hard. I will fix it and wait for couple of days before 
sending out v3 to address any comments from driver maintainers (if any).

Gr. AvS
