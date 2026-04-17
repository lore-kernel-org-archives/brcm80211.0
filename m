Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9840370D70
	for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 19:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453497; cv=none; b=mSD9Y2EGOY/krVes+mrt1sBmqliONSW276ETShn7IpvKAVP6jQK1Dx2qde/Mbp02lPPSmwLkH3zOiFJsTXE3H7hDRQ1TqOvtYe1RBcsze4RfuNyJB6QujDejIcP9EmLDcNdogmBsmgxg8HI2bi/3ppGt5ehh2jDzWf+rrpkReEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453497; c=relaxed/simple;
	bh=i5Hr+IrciRHtIGa467IeTT2/L9/Aw6kLDM0TNojI/Cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KI09YGQi++FykzvGRc6TitvE7gjYd3dfoW3mDiSyEkXvRvYYJO98hj9AuxgtUWBMVIsDk6ForzZTve5OZaarwovcYBZtTPQULjcCbMk5rD0X7Rb+wtj6umNvVQgDLOKrIwIeUDK/v4w2inEHgSkaDgcxINuXs3F6VrX2L547Li0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fh8C7VWt; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fh8C7VWt"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-651b0eb2564so1210473d50.3
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:18:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453492; x=1777058292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVVQCF9h+sAxtCNaCmqreT3GLvw2hIVqYn5OjvvEPxY=;
        b=g7ec198XhnaCkjtmPDVHvACoU5ent2dPYounxRyvHx49CRvIWQlSnIquKXR9RBbv50
         AZy5T5X1cpa0FZGGIQ/4qJEN7BVnuYpHl4ijwxsA20hF0SwbH3ZQTw39Hu9g3KKBO56m
         6RoDbs2bBakGW4Zjv2YWZhAcynFHCGlSJK5ksg0YO4InwtSND7ObRIORJHh3EbIucvOv
         fhBbyk8cD1aThEVmtRtYcFVXM11zpWagWj8sd3m3OLCjrGV/eENaz0MWk6Y7HSkV4keR
         1ci0ije43mEmjJMwdXgcBFFjWiMtAwMKgIpDVn7AGy3oEbKhageWlHwEE1EP85W6+IDO
         DoRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+iK/j9QzQcQ2h/kcO2VB1etq9Jdp8Wga1b++xhtJTwdAgTYUcA27wt0TxrIngZXrVoZXbddcq/KVg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxCieob/tL1BlvLETu4C7K7aRI6KemYAwPgq3CzlF7X6YWJBz3C
	MFSDFsi6eJQAH1iwVh4n6xzKhbqGDBGMh4k4Qx38AXVwrirvSU2JXk/CkP+UTifEW9Rf2qo4Os8
	TVb/RmI9ue94ArPqjKjdShSAMjxjmDFgvI2BhfYSSZisWnHkc4FgfRCsM8Cxn/pyn7mVAuJWfrm
	IXySZX5aFL/+IGilxITs/OwngLTfyUQVVjdM0AKnQjQbdBijPvpcfL5yaKgCh96CLXSV//AAF+p
	GLUZIvjfc5UIXAMg+hnbg==
X-Gm-Gg: AeBDietGsaqllbIZEmVSMoqsiwO0sjFB24T4XWBPCTiGlXtT0bYlQR2D0V+ED1wj1mw
	Pqlrcg55HlFX16jujbnmLDssVnlUGvZi4Prf1pTdcgE9pxc0lipqCy+hES+lpaisqjR4256+gBv
	vKsjKo34EkKx+OiHmlqv5zK9B1V4IBvcl/arS5K5gAL2oPahzOfvos/rVtCGQS15tp3hxOVAzoh
	TmWHWpKnwNK8faKYRaoQ+brGHArtbwjubxFeRl06OCXpGFOW+S1cLZb+z4nJpTVKxje2xmP3UEA
	9zpADD7hSxAMfR1Ek1SXnKppdrBccAvQVENTkrCO0/Xe0sNrzf48+DjF92uxIF6zPCmM7EJa52i
	H2FBG+iWiIf2dbhE2vUcTm448MvWky4AVHluI+A+E1tA5cJ/ZQO0eYCo25wFaZEWn/0vuBTjUlf
	bGILvTcEw0VH6+a8sMa1mPmOdcGrKWgJ4kvSm2I0N8/HVBlKhJCzqnf90dWUREzqgh8Ry2rIQ=
X-Received: by 2002:a05:690e:1914:b0:650:88fa:f5d0 with SMTP id 956f58d0204a3-65310b684c2mr3996212d50.65.1776453491773;
        Fri, 17 Apr 2026 12:18:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-90.dlp.protect.broadcom.com. [144.49.247.90])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65314e8163csm172530d50.29.2026.04.17.12.18.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:18:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8e4c29caso24288011cf.0
        for <brcm80211@lists.linux.dev>; Fri, 17 Apr 2026 12:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1776453490; x=1777058290; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CVVQCF9h+sAxtCNaCmqreT3GLvw2hIVqYn5OjvvEPxY=;
        b=fh8C7VWtRHy7dOB9XnXcps3zU8w5NEHW5Q3zDZzzrJB/o53smkEwNypclkLqC6X6RL
         5hZb9hzpA/RRJlFzDLQBpn9jcZ6C+QudJfiu5ibTDcDPAHuvJW3gA1oNEq6gdGdQEKPP
         BilFxw/FuM4Gy8s4siRuHwCxHX4pc/aP9C2tw=
X-Forwarded-Encrypted: i=1; AFNElJ80uQPx2GWRFeEgf+itVhZAWpEpmgWQH8dWqgBI97O61ly14S7T10qr+pT0oUvabd8ATLaZhpWk9Ts=@lists.linux.dev
X-Received: by 2002:a05:622a:59c9:b0:50b:4f75:c925 with SMTP id d75a77b69052e-50e36c2101dmr55295521cf.24.1776453489841;
        Fri, 17 Apr 2026 12:18:09 -0700 (PDT)
X-Received: by 2002:a05:622a:59c9:b0:50b:4f75:c925 with SMTP id d75a77b69052e-50e36c2101dmr55294981cf.24.1776453489402;
        Fri, 17 Apr 2026 12:18:09 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e3948c861sm18615161cf.25.2026.04.17.12.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 12:18:08 -0700 (PDT)
Message-ID: <8fe89470-720e-4b30-a6a1-ac6ff58002d9@broadcom.com>
Date: Fri, 17 Apr 2026 21:18:05 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmsmac: phy_lcn: Remove dead code in
 wlc_lcnphy_radio_2064_channel_tune_4313()
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <20260403193324.141753-1-chelsyratnawat2001@gmail.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260403193324.141753-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 03/04/2026 21:33, Chelsy Ratnawat wrote:
> The variable rfpll_doubler is initialized to 0 and then unconditionally
> set to 1 on the very next line, making the subsequent check for
> !rfpll_doubler always evaluate to false. This results in logically
> dead code that has never been executed.
> 
> Remove the unused variable, the unreachable conditional branch, and
> simplify the fpfd calculation to directly use the PLL doubler values.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
>   .../broadcom/brcm80211/brcmsmac/phy/phy_lcn.c       | 13 +++----------
>   1 file changed, 3 insertions(+), 10 deletions(-)
