Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EAE29BD91
	for <brcm80211@lists.linux.dev>; Fri,  3 Oct 2025 16:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759507224; cv=none; b=V/eVCnQerZuX/7hROxEzlrgZkwXcf2doJOvRDUWSBmL1DnOs/KKL/Z7J6BoLujRx57kWerYgxSMgj1hpscsX2q9ocynORsEMdcjfjLFU1aE4wk/fCTAU5rSNryGX2gDL9pMkFCenmxshngByybPjaRhm+8IskYsF/EEeWsF3QVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759507224; c=relaxed/simple;
	bh=qeBXk6ZxCgM8dte0UkFnj58GTDcppJ1R34Pxrk8rISM=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tOTCVL8N3wdTtOZ5dHoOrE4MZ+VjfnSTBJj89qqh7HtypcyE2ofxZvswZtsRMtWoeryw7fGJpJIvavjcmXj3S0j3N/cWiIm/BbFYzPT+g7BR9sf0JmSjRwmhIa9WqjVAoyPgsdtu7bbSGHZyoCjXtVlnRxH5qUepvZhGQpL4bkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZyWXFQ+k; arc=none smtp.client-ip=209.85.222.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZyWXFQ+k"
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-890190c7912so1083381241.2
        for <brcm80211@lists.linux.dev>; Fri, 03 Oct 2025 09:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759507221; x=1760112021;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIRz7gWQ1Xu5Iai6JSmMimzSEA8Q3m4VGxXaY2xiIFs=;
        b=CoXSkMLuh1FvN7fddkCRpEVHku1iq/f9r5Q6BIjrul9G4Q3V14V2jNeqzjgrTXWKqd
         LO4p9TVbRAl8MVKJ9/c75DC+6dXMB6u7IBc9F3Y8ZvWzj4DELaDiKImWvsLHtYOeWwTc
         RKJYWwIv56k1MUw+kpAcA+cqTtFlLSop3iIYKwsQaYL8GXqcbO7jrMeDO+rEuNFvJgxN
         uzZQeJKgBnTukGDzdbF6o0oNdOzUXVMyWSdhqu0q8jr3vDHDieIu8QKdIsGWPQZNQYPy
         B+cL4vRJBPRMSXElQ/nnCiAyREUxt0npJKkvdXTkt2Z4aiKot63NI3ew2bLuxoKABL9I
         5lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJz0Xy4VSVUvkQjOEQNIjKBHnA+JqqJ2yuVuxYRdofo/yvcWpyRnclkbUR4pw4Xb8Q0j/sUAt5qoA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKBgyzlDzhPgry7+7PAeiRScdvDUP0dSaJQ2zp+GhQOjwzYuk9
	My/clgmNUmBwfp0q8NXlZltNoRJvgNbdW5smrH0pdP03RFJSGfGgSGONE7zoNJg+hB1UZ8uEHOr
	/vjN9pLlCs7868D9KmGkFmHPDQc/0ilIypgb5jItFBb61Ix416MgewmcLdN6p4nfLisi1HI9P3Y
	SZh7AlCqhKblDgcVvYLhF1XLidwAytJfUgOJw2esu1I7l1ERuUeCql1jlfL4pOGioSV9U6FxDU4
	TMPI4rcFyfjCpWweu/2lw==
X-Gm-Gg: ASbGncuJt4jtmkrNSmRaseNqTB0vJy237tBtV9qN3MdmEmbBwJm5juN1LnPLYqpdpXe
	ADWj5MRWcRVy5JWdKhN0ymSZWLJ88jRMwRIcj1Z1i495XHTkIU7lyxVHdkeo+ASDQTuAUP1rEek
	xWivEdtAzlt8GRzFZABRKcdk/d0sHcZW/9Sc08ZOVhVAv9NFBI6+6aysLIB40+gJdExclSmR6rI
	kPok4B6hAz28G1ZEKN5R7Zz+TYhScJAHZeqlmF9QHoTK8T8PZLMhrFVMSrQYrhHswAO02J7085w
	unqttQWg2RDHlO6e2v7xx149YQ0uP9kmShlzIRWfX8y1qbcelJjuVajqmRxVnuiSpWe5ZYCXnLd
	4vEBx7Fixy0tyaHF0LzXwc7PctdA3UxWJ2/PB419nf7Amx/4uQGhI2gUMRpuU+Jvje+8uC86urY
	duRNzGXo/l+mE=
X-Google-Smtp-Source: AGHT+IHsoQD70A9mvep42xAIS/pweJ2TokLoE/6xO6EUNKzz8dUm7V6dm2VvDX0rodlapN6Rh6VX/1bzkEOt
X-Received: by 2002:a05:6102:4a83:b0:4dd:b037:d239 with SMTP id ada2fe7eead31-5d41d049190mr1327014137.14.1759507220912;
        Fri, 03 Oct 2025 09:00:20 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5d40c8e8319sm459672137.5.2025.10.03.09.00.20
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Oct 2025 09:00:20 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b4813c6cbeeso194688666b.3
        for <brcm80211@lists.linux.dev>; Fri, 03 Oct 2025 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759507219; x=1760112019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIRz7gWQ1Xu5Iai6JSmMimzSEA8Q3m4VGxXaY2xiIFs=;
        b=ZyWXFQ+kO4vgzUTTb994u/lIQ8IndyDSnLzTY3CCmFFU5hDEWJC0l/mnJ07z+e9Ma5
         SpTwbt9pY4HqEwPXQIZaqo5LpJXsc4yb6E+Gld6v1EmD0ED3DqF4gRgvwf6oKkLW3Mxu
         y5OQd++YRqN485HvXwM5mvlP4U5iLxngJpZkM=
X-Forwarded-Encrypted: i=1; AJvYcCVZIO65x22eF4SPLhtwLxClb/jCobA5bx0cuHgWUIPPKqCJ1jlV9otiQIi+Js3XYVLQo52YFbym37c=@lists.linux.dev
X-Received: by 2002:a17:907:1c90:b0:b04:2452:e267 with SMTP id a640c23a62f3a-b49c4394d63mr422921666b.56.1759507219414;
        Fri, 03 Oct 2025 09:00:19 -0700 (PDT)
X-Received: by 2002:a17:907:1c90:b0:b04:2452:e267 with SMTP id a640c23a62f3a-b49c4394d63mr422918566b.56.1759507218910;
        Fri, 03 Oct 2025 09:00:18 -0700 (PDT)
Received: from [192.168.178.31] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm467071266b.49.2025.10.03.09.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 09:00:18 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Richard Reigh <richard@govivid.ai>
CC: <brcm80211-dev-list.pdl@broadcom.com>, <brcm80211@lists.linux.dev>, <chris@streetlogic.pro>, <linux-wireless@vger.kernel.org>, <s311332@gmail.com>, <wahrenst@gmx.net>
Date: Fri, 03 Oct 2025 18:00:18 +0200
Message-ID: <199aacd7e50.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20251002232002.124609-1-richard@govivid.ai>
References: <b2e0bf04-f149-4a23-aba5-cad55a8923c1@broadcom.com>
 <20251002232002.124609-1-richard@govivid.ai>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Re: [PATCH] brcmfmac: Fix NULL pointer dereference in P2P action frame handling
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 3 oktober 2025 01:20:21 schreef Richard Reigh <richard@govivid.ai>:

> When iPhones query network information via the WiFi settings "i" button,
> the brcmfmac driver crashes with a NULL pointer dereference. This occurs
> because the P2P device vif is not initialized when handling certain action
> frames.

That does make a lot more sense than the line that gdb gave me with my 
driver rebuild attempt.

> Add NULL check for vif before dereferencing in brcmf_p2p_tx_action_frame()
> and return -ENODEV when vif is NULL. Also modify

Now I don't think it is necessary to bail out here. See my suggestion below...

> the retry loop in
> brcmf_p2p_send_action_frame() to stop immediately on permanent failures
> rather than retrying.
>
> Tested on Raspberry Pi Zero 2 W with kernel 6.1.21-v8+
>
> Signed-off-by: Richard Reigh <richard@govivid.ai>
> ---
> .../wireless/broadcom/brcm80211/brcmfmac/p2p.c   | 16 +++++++++++++++-
> 1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> index 10d9d9c63..2c73156fa 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
> @@ -1559,6 +1559,12 @@ static s32 brcmf_p2p_tx_action_frame(struct 
> brcmf_p2p_info *p2p,
> else
> vif = p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
>
> + /* add NULL check */
> + if (!vif) {
> + brcmf_err("vif is NULL, cannot send action frame\n");
> + return -ENODEV;
> + }

Instead of giving up and surrender we can use primary vif, ie. 
p2p->bss_idx[P2PAPI_BSSCFG_PRIMARY].vif:

if (!vif) {
        brcmf_dbg(TRACE, "no P2P device setup\n");
        vif = p2p->bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
}

Regards,
Arend


