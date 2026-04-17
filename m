Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B1B3C555C
	for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 19:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454014; cv=none; b=W3xOgmYFKB9NG5RTvHzp/WNpruQa/DjeHPfQmcdRedz+WHRXOlEUXpZcQIJWHqdkrL2hF697AXpBdW0YaQlL5pkEQxAUiJK0ol8OpMgluEzMZE1F4kTOpNGE9QAI3iXKoVZUrFz7Qbo3vF+caVEm3rgX1oPm8FQaWcwTN7fkq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454014; c=relaxed/simple;
	bh=c46MhwJjv3+RX6D1Ajl2g2/Z8vW4GKzlDlrVDuAkbm4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SKRu8L5/f/r762JluIiXkHjqlkwo5zwBnRqe0SkrjpWSABCEwii5LNT/ege1/kIz9aJItOWs3LW4hg+CuopjLwGy4k2a6GrYiDpIw6av4wCiiAe0S4MSzLMRKsB76ZiaIwBnzmgaBGIKQ5+jPtqdV/gqKQLRiaLUcMjV2Qq/FfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Rni5aKUP; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Rni5aKUP"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-506aa685d62so5740561cf.0
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776454011; x=1777058811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psFzhtTARPiia800y0nrnAWpk78pBCr1jh1L3zJLkQM=;
        b=kjsSPeFWM1Z2Lw8teqMj6k96SvOTjhddcmiLuUcu1NB/MT+nM7Hqk8oUn3fq8VOGF0
         FvQQr0s+a/hBKqsvprW92TMQHTSShiZhJ+PaVwBoGzXrQ3p3fTrKYIV9JGBoGVZ/JfNE
         FbdQyVfMBbsCnIORgl495CV1CjczE2k48I0r/tIxzsPoYRR92xPtps2JoSxd4jCUUSRU
         P72jZ5g6w5hk4Btz9Q6TIL72BISAdspYsVo8pOgNyXsM7b/3F/EpTFV2dcbXhtEKhqzF
         6SdisEgS7aXoJqFzD6ST2RsXXrtubN9YJpJU/7ake8B2sMM5m42GYB7Umvch+bakg688
         W2dw==
X-Forwarded-Encrypted: i=1; AFNElJ+48kbToRTKXxJovHG0lsxqowZTzYp+CL0G6LOZ3S7UNOfflhLmmLB+oPB7zdg4cO6iABRlhepm71o=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRoRtmob2vAZ6TuyIUbiis1nG8Pvmu4dTVt/kOm7nTAXdCwg79
	got7QXUNcVeTHr+qvmkLI0+lRWGZ285JV7HCf+SrhagSyvw8E3RxqnlpJbj3ckrqIyCrPLVI7Ze
	nOc78nhGkYw8rTy+zZ6+InfWvQueP36AyboUdQDjuTUU2yw+YF6JzO5fag0TkYJuyV1jhHuvFm0
	ux2sYLUUcMazf2SbZwvv69d4SYGZBdgok953ASKwgKTbfGJye4A6skkYWc8RbvllhryY0EA96fF
	PQT+CqIQOcLMrv9/tSsQw==
X-Gm-Gg: AeBDiesm8YbIE9zhQCqfS26MwNwCsMuFx3V7BaHjDWeZHK+TExI05fyLd9wGhleLRYj
	N3+unTc8Kw3xwj0e8ZYmBA1o9z7fzuJEUFAbKCdVcJVTw1LPZWeUhysJLRFhGkSRfRt09RBQnt3
	gtzRc6napKSp4evM+kiAvsGCl4VJz3GCDOf2fxLJH2/omhsE+LfCy9Jm26J0IclnWzgQvgF2e+U
	Pb7MhzoS9G3ZLyu0azmr7tbZ0tF94083EBblhCS0sPIX6nJZDYV/CyhCoVjOywt1W76L01JaG9y
	XUbqWOftBF6PQQ1lr0yrWqxEOCrUoCLWRc7RaUn2VEUe29F4vH6v8575J1miuGb/ryYYTyOQDDN
	KXoaO4yNcqvWL28HTgqUM7oH0M4a/5ctYmqQ6KwcjqAJ/OcXxWn4mEywNcIOklmcckut2QVfZHm
	oVwDYBewiuvAPcl/g1zJQ/9droC8L85u8Rw9TN0TRLwds2PPmr0Bo00hbvvwZOcaVLuygQYvo=
X-Received: by 2002:a05:622a:13d4:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50e36bd641emr64284181cf.39.1776454011357;
        Fri, 17 Apr 2026 12:26:51 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-15.dlp.protect.broadcom.com. [144.49.247.15])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-50e392ee3a1sm1702351cf.7.2026.04.17.12.26.51
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:26:51 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acb85a973cso17647716d6.3
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776454010; x=1777058810; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=psFzhtTARPiia800y0nrnAWpk78pBCr1jh1L3zJLkQM=;
        b=Rni5aKUPYOYFZeMi4s7N16lH2WwNy5enB0RdXWwxf3UzXqKFNQlTWYh97oSReQlLiG
         GkwVMovsATQz8dBffqsuQPt4j79a8gjpocVf2Y5VbKJRkcZHN8trVJdsBrYre/LGN3iR
         Kt3JM/omX87ihAbHhhVlD+1DSDbpo4SYliD0U=
X-Forwarded-Encrypted: i=1; AFNElJ8cKtxAEK0ZC6xDHlb/9Nz/RnMD9tyhesOdS+lmGwRc5ooyVPCiQgvc/ELPCQ+zOrSl0dAsI+BrIsI=@lists.linux.dev
X-Received: by 2002:a05:620a:2986:b0:8d7:a2b3:3aab with SMTP id af79cd13be357-8e792b5d38cmr612160485a.58.1776454010455;
        Fri, 17 Apr 2026 12:26:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2986:b0:8d7:a2b3:3aab with SMTP id af79cd13be357-8e792b5d38cmr612155385a.58.1776454009744;
        Fri, 17 Apr 2026 12:26:49 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d64cbbdbsm198331985a.12.2026.04.17.12.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:26:49 -0700 (PDT)
Message-ID: <de97fcd3-2ea5-4855-bfb1-99483a87deaa@broadcom.com>
Date: Fri, 17 Apr 2026 21:26:46 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential use-after-free issue when
 stopping watchdog task
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <CGME20260416093428eucas1p2fde898f84c1e15dd94d1ecb52707c72b@eucas1p2.samsung.com>
 <20260416093339.2066829-1-m.szyprowski@samsung.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260416093339.2066829-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 16/04/2026 11:33, Marek Szyprowski wrote:
> Watchdog task might end between send_sig() and kthread_stop() calls, what
> results in the use-after-free issue. Fix this by increasing watchdog task
> reference count before calling send_sig() and dropping it by switching to
> kthread_stop_put().
> 
> Fixes: 373c83a801f1 ("brcmfmac: stop watchdog before detach and free everything")
> Fixes: a9ffda88be74 ("brcm80211: fmac: abstract bus_stop interface function pointer")

Looks good to me. Maybe add stable?

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

[...]

> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
