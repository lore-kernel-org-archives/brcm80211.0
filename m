Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE7D2D3225
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 12:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785673486; cv=none; b=f6lzyjGx8KKhO81xZRDeeH3TcekCwDRAGotWWliyA/PQlz3p90YOSS/mkgtKLbWgAuHMrngy7vCIg5exOSJNoFI3G+rKBjfg4MTX3ycgsWimrnaHCf4lddHqOP48DKVrWEEeH/9M4MYgEK8xsN7/x8dL7E8PUpzuXA9gREahbL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785673486; c=relaxed/simple;
	bh=IVBACOmNYotUTjgF9C6tiVB81vMoFAfRoriF976EZok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZnJN904CQBuYQAeCwWYFGgXvzewc/EAgUlOECfAQHgkTKfcai+XEfKvwjLpC+aq43C8uigCTwHJtAaMn8j0GgnSVDCf9eYbo6GRgqiHJfOlSWkkEwkthfGTo5T1tMAOHTgcDCdEw5uoF6CjfTY4imS4nwIRAl70hikceT3O7LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bdETKT5b; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bdETKT5b"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7473e927969so624287137.3
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 05:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785673483; x=1786278283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QNXeMyhkpbk8rwnA0O7uBQvIUEYbGICoPWDBw29OKOs=;
        b=HxkO5uXP8CUUYAIOBYQ7Q6Pb3iW6q5x3juGq5fVZd0AZ5imhZpA+I4A+ubW0od5Y63
         YdIuOY/mC8uL3ayEYDYh91BM+Z8VwAAm1UNWT2IYp29QVD7AOS/t+iEzsfSo456yB56V
         DaL2pH09Vt6AUOH/nKVVkCPUxD0oL6ghQQdgRRQfsburn61xhwGye+UlrrB4xoqwp1Nj
         V9HSKAZZ4YPMGmREs2i9h0qEqbs3St0K4qrVoRLCWucbYn2+7hKVLpUp9t5quvTmxiW/
         AhTXGpA/q3KZKaHzfWkjhPYz3ixrAcrjNSYpNAtIkpxCWQVa0BrPxGLlrgXJPbcci4EP
         68KQ==
X-Forwarded-Encrypted: i=1; AHgh+RojqVuds0AAAW/Qpp4CdC1aESTjGDjb2dc8iRGTSIJHFE9QuSp96M/N02CRKw8HOUVHnpV/TSO8kJE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9MmdjU/ULPE64lPYykDiGrajr04/6/YSHgm/DuVqV1UCpi5Si
	5PSLgc+s+9wKFCyCTeOHTrXWGGC4a6Z7jIChUi0BzUNxNoBkCZxabdcicqq/UsGR8MZMERnl5q5
	QUZ7n4HJ0JUGFe0C0WOyrY+lmwF8WXBykmR88FZ6Tfmrn54HYbBzkYmOkgKw6PUms5OgOXzp8UE
	bfMU4e89cPMjUZWFqkxpZUJwjJ26PTSH9ufcnmpyUdxAz4g+B8OTKCz06W/n2Qro/GCWpLw7U75
	jXhXlycp6ffYbhZM65YLg==
X-Gm-Gg: AR+sD12t6gP3XfiLf5+rEHqZoITJRKHKge/2Ih8oW5k8A54gkN8PK71ENHdpxQbPgyW
	9Z2n+SWDPCkXyP+E8HinHq4XZlHQJJzcZdKF3dkb8iggPSmPRFfBSWVrQbBv84DyrdpKeXHmmOc
	79nqo4curd4G4jakttOYHZTDq28ziCwL4YxSSyp0depqBDCzqVAicJ/ISHsCYSKMKXuglr3GIpb
	o4z9fSlEfWioB4RvVaSD6bRVI6pmZxn5oIkEb5kqNXTwOX2sCavQa2Xpw44JfgaoCMrchQ+MVLj
	FOK5qs8JMO/B2+51gXCTU00f91o+PoIyAR6lRViJbnOvNw7CwClua3dTssaaQpUAMSkvJtpsb0V
	r0gBRVahz9m682dyuTN2HFnBhc/+BlBWGkWOCTmUGcfYPWJDESrCGpf8v5rqBXbrqUyrBf8GyhC
	ahvzF1qv4Ld+PAQt6wzeKW0s4zBCavPw5rs8XNMAo=
X-Received: by 2002:a05:6102:1496:b0:737:e354:4092 with SMTP id ada2fe7eead31-75b23a75ebamr4697447137.11.1785673483447;
        Sun, 02 Aug 2026 05:24:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-759c9562314sm569567137.19.2026.08.02.05.24.42
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:24:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0f0a0760so51482451cf.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785673482; x=1786278282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QNXeMyhkpbk8rwnA0O7uBQvIUEYbGICoPWDBw29OKOs=;
        b=bdETKT5bL3Y3d+V00yW2Y9RPvrwUQQL2OAKLyPlP6/DDvlPc3oJUwrZTgsa3QpUmEu
         iG4QneoH/vE/X4awG7i0h31nH1VU/CVsN0UMrXY4OiHghYb+j3fI+yybP3g7LIGyDwoR
         o7aUqcDa2w2lHALyBxh+STZXNsIIFtZZDCQxU=
X-Forwarded-Encrypted: i=1; AHgh+Rq0ukOVWJpBeIGoeD8rnz/T7cq1FbVd6gWOsJgCwsoZgSnpkI50uQM+feJPcDgOFbwcjA2X7oS8WHI=@lists.linux.dev
X-Received: by 2002:a05:622a:5906:b0:51c:8439:14e5 with SMTP id d75a77b69052e-52b566951a7mr125476461cf.10.1785673481804;
        Sun, 02 Aug 2026 05:24:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5906:b0:51c:8439:14e5 with SMTP id d75a77b69052e-52b566951a7mr125476081cf.10.1785673481411;
        Sun, 02 Aug 2026 05:24:41 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4eb6a84csm42125231cf.18.2026.08.02.05.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:24:39 -0700 (PDT)
Message-ID: <f449500c-74f3-40e0-bbcc-ee560951714d@broadcom.com>
Date: Sun, 2 Aug 2026 14:24:34 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless] wifi: brcmfmac: validate msgbuf flowring IDs
 before use
To: Can Peng <pengcan@kylinos.cn>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260723055618.550834-1-pengcan@kylinos.cn>
 <20260802083905.3819981-3-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260802083905.3819981-3-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 02/08/2026 10:39, Arend van Spriel wrote:
> On Thu, 23 Jul 2026 13:56:17 +0800, Can Peng <pengcan@kylinos.cn> wrote:
>> Firmware messages carry flow_ring_id values which brcmfmac converts
>> to an internal flowid by subtracting
>> BRCMF_H2D_MSGRING_FLOWRING_IDSTART. The resulting value is used as
>> a bit index in txstatus_done_map and as an array index into
>> msgbuf->flowrings and the flowring state.
>>
>> Validate the firmware supplied flow_ring_id before using it. This
>> prevents flow_ring_id values below BRCMF_H2D_MSGRING_FLOWRING_IDSTART
>> from underflowing and rejects values outside msgbuf->max_flowrings.
>>
>> In the tx status path, complete the packet with an error after
>> removing a valid packet id so the skb is not leaked when the flow
>> ring id is invalid.
>>
>> Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Can Peng <pengcan@kylinos.cn>
>> ---
>>   .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 46 +++++++++++++++++++---
>>   1 file changed, 40 insertions(+), 6 deletions(-)
> 
> One nit: there is a double blank line between brcmf_msgbuf_get_flowid()
> and brcmf_msgbuf_dequeue_work() in the resulting code. This comes from
> the pre-existing double blank line that was between
> brcmf_msgbuf_remove_flowring() and brcmf_msgbuf_dequeue_work() -- worth
> cleaning up to a single blank line.
> 
> Minor enough that I will take care of it while applying if you do not
> send a v2.

As I do not apply anything anywhere maybe Johannes will, but feel free 
to send that v2.

Regards,
Arend
