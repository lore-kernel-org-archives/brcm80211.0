Received: from mail-il1-f227.google.com (mail-il1-f227.google.com [209.85.166.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338A221F26
	for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 11:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760355237; cv=none; b=thcT0OcztNzQ8DS8TOrSgymFbvbW3hGEbjfOsHeuJiy1FFf5c5wowN5UAeXLXqHMnheRUTdHqqFl3eGhfm0ljJcNV5meLJEpwbMwYAGQcOtlnn3iqA/U/IuPZ75+C1uhvt1sm4UdhYSTbS7YW9NQ+iiSZZyYRAA5iVKzlaU70GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760355237; c=relaxed/simple;
	bh=/OvjI94dc8ZRU0Lt7OAWyHcYfEotIbmlebyKuelkavo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjqY10QiZEKwiiEjLAvc/YhPGyfT4QtDcESNIdl5cqR9++BqujMLpv8ga0O9eHHQ9Q+NmslHQBD0T41dCD1Qr5OVvK8c9mjQCX8sH6WFhimlYjEWwaaP78e9e6/WBPj2GASxn1joITvEf9PYkqTX7v8ocV8zbsD0xJZC1h/wmlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=adcDN8U3; arc=none smtp.client-ip=209.85.166.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="adcDN8U3"
Received: by mail-il1-f227.google.com with SMTP id e9e14a558f8ab-42f8d7f116eso16613985ab.2
        for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 04:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760355235; x=1760960035;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzZNrEoavuEwRdR40sndCnNWJejOOVpgDVKtB+Z0zf0=;
        b=jR2LSrXIpPsWI3Qn47rwUsXw+GBVep9H75tdUSV/ko34DtZrY0GiiyRlfcwOWYXAWc
         g0g/dkzC7caBSblQUCUieG65LK0COfjFk1VSPUCeU46lxhSSpTPTlm1d7hQ1itjeGPeU
         nz9yJqrdjQMwz8z3AKJf731DhKYvQhrqk6+6Cx9rnnekttI5UG1Z9qTmoFQ6JIcHiuu0
         zuzTZG3aSeuY/6fFunm0+FljyCMlocybaKL2bukjq35QibVLA1685CnZFKYTZtyg35qh
         LIDjmIXnQ4ComZ0hCbMMABmGqT9f2Y75IRdxHRjivgLuPx62Q5pfFg8G07Ijzhqqi92R
         WNcA==
X-Forwarded-Encrypted: i=1; AJvYcCX1yGTFSlw7ooQyImrn3YFUsHW3w01gjiaNGqRG2iO0b4H/S8LF/ojl6DEKmaw74ioHizIVbkJbJe8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGZ/SUJavMGOsBP2uKpWfU+/Uy2w/vU3FpMYveuC96mbAAQ65N
	KXhHl6lEM9VSGkRc/T96CTTNC6YPfBpIuxxX1FUo+OZ1xU4rryZ7BmfXsZII4dHmCNZwtZq0r1c
	OURcSdEvaV5LaIazk0HPIAz7i+nBD/ET9b3WXr/38fQvopjUcOpA97j6BZw8BQ+Q6izjkAXd1dU
	xcenwaXbZlgku4z4j38wFwQyRvFHKkYUhrjdlpScMseqEO6yHzV/8YI5m8EjxnUr3ds1e7hhh9A
	oa2YAO2qkqvGAsXnVPwjQ==
X-Gm-Gg: ASbGncu4WNlBV94my7Lp+9kTIFSIy1Tt8/2ni73Fu4GDrhdhSqMrUIDWFwbQoLYqBtY
	BKIchEJYrSL3c5tPnhdwdH110bBUz5oQ0f2p6A7X8Mfq3b/A5AJFKdr7EwKoiHCOgTDwD615y37
	6eZIGC0O/rndn7pKguHzuhZfMz9BsX/KY1yiZv7MLkgWtePlNr7OjiuGjj4vrXFzuLqnEx6sz9/
	qTY1yiu47h/tm0n4WL4oMda+ldwlkFZ9jpwz5JzIbJkruwE9kRR6ZazqdGf5pnUHnQnFxc1w5Fd
	D9A3PMNn7ZmkY/FCz1zmKce8HkWjz04DWbDn4ms/3DwegrR6TIQ5SsSpys6oZuzsZuAMcCywEGO
	GI6rSoNOjTB4NeTmDYPXd19zVr/gWpk12CqjUZxzZw3Dg5NbEooyOBuTsPFvm4r6xxbp1D/iTPo
	nOblfukA==
X-Google-Smtp-Source: AGHT+IE2wTa4HuIRrRipmvvqUbf6N7w2yGoERQn07UV0O8UsX4otYNMxCEU56GmtKJEwXyln/Dm0pwqhEwyG
X-Received: by 2002:a05:6e02:184c:b0:42f:9c5d:81b1 with SMTP id e9e14a558f8ab-42f9c5d821fmr137857065ab.32.1760355233846;
        Mon, 13 Oct 2025 04:33:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42f90263653sm8393755ab.14.2025.10.13.04.33.52
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Oct 2025 04:33:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-86835654255so4108554985a.3
        for <brcm80211@lists.linux.dev>; Mon, 13 Oct 2025 04:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760355232; x=1760960032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dzZNrEoavuEwRdR40sndCnNWJejOOVpgDVKtB+Z0zf0=;
        b=adcDN8U3FnWpHjim00mtXcD6m4UKY+36Kk/IaT2ibCOdb3wtVL8OR4iaxkLjaG4qD9
         8IIqd3h6sLojolZ7M1fpxn1iaxxbR4Ye8Vus0Mi+/5iPndUkFGuyH+ER04qdjDV/tmJ2
         SFCrIMa8rLb61fp+NCxFBQnVAAJgT2klVJsGA=
X-Forwarded-Encrypted: i=1; AJvYcCWzGRz5jl9RvHu/nPqTMO+RmKKAuBKps6cCiMpjdqyxtEnObpqhLmSou6wXGL65+UvYNHyDw5WRC/k=@lists.linux.dev
X-Received: by 2002:a05:620a:a515:b0:886:ea5d:9270 with SMTP id af79cd13be357-886ea5d939fmr1176259385a.72.1760355231742;
        Mon, 13 Oct 2025 04:33:51 -0700 (PDT)
X-Received: by 2002:a05:620a:a515:b0:886:ea5d:9270 with SMTP id af79cd13be357-886ea5d939fmr1176256285a.72.1760355231289;
        Mon, 13 Oct 2025 04:33:51 -0700 (PDT)
Received: from [10.176.5.85] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849fe858a4sm960780385a.26.2025.10.13.04.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 04:33:50 -0700 (PDT)
Message-ID: <08f5a413-7bd3-477b-a78b-e9798bb42208@broadcom.com>
Date: Mon, 13 Oct 2025 13:33:45 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: fix crash while sending
 Action Frames in standalone AP Mode
To: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
Cc: brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 chris@streetlogic.pro, johannes@sipsolutions.net,
 linux-wireless@vger.kernel.org, richard@govivid.ai, s311332@gmail.com,
 wahrenst@gmx.net, wlan-kernel-dev-list@infineon.com
References: <4d24f3ed-0b7d-45cb-9dfc-b8b5e0b37fd2@broadcom.com>
 <20251013102819.9727-1-gokulkumar.sivakumar@infineon.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20251013102819.9727-1-gokulkumar.sivakumar@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/13/2025 12:28 PM, Gokul Sivakumar wrote:
> Currently, whenever there is a need to transmit an Action frame,
> the brcmfmac driver always uses the P2P vif to send the "actframe" IOVAR to
> firmware. The P2P interfaces were available when wpa_supplicant is managing
> the wlan interface.
> 
> However, the P2P interfaces are not created/initialized when only hostapd
> is managing the wlan interface. And if hostapd receives an ANQP Query REQ
> Action frame even from an un-associated STA, the brcmfmac driver tries
> to use an uninitialized P2P vif pointer for sending the IOVAR to firmware.
> This NULL pointer dereferencing triggers a driver crash.
> 
>   [ 1417.074538] Unable to handle kernel NULL pointer dereference at virtual
>   address 0000000000000000

[...]

> 
> Fixes: 18e2f61db3b7 ("brcmfmac: P2P action frame tx")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
> ---
> 
> v2:
> - Retain the reinit_completion() for "senf_af_done" in existing function
>    brcmf_p2p_tx_action_frame(). And move the init_completion() from
>    brcmf_p2p_create_p2pdev() to the brcmf_p2p_attach() function.
> 
>   .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  3 +-
>   .../broadcom/brcm80211/brcmfmac/p2p.c         | 28 +++++++------------
>   .../broadcom/brcm80211/brcmfmac/p2p.h         |  3 +-
>   3 files changed, 12 insertions(+), 22 deletions(-)
