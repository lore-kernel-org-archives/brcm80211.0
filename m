Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071525A2AC
	for <brcm80211@lists.linux.dev>; Mon, 12 May 2025 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039615; cv=none; b=BljUNOI0baDd6pZqSyq8n1B9QUcuVeqR1vH6kPhkd55uGrNctNX2NlCPIrvAC0YlXZjk4geHixnRZuScaQ+KBquXkh6ZfWo5JGuL4eEoJOtx0gIQCfsMOZBcZIr0Ykb4H2PHNQN9tYqLx967UCCRkJUBMO+GeAAitqwv/+hjw20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039615; c=relaxed/simple;
	bh=vrglOT6WCOlZrLl+nt8DvblDLEP8Sjzh+Sz8O8ABo8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BQSA/u7MlzYArTECNDfYnkDkd3HHAKYadH81p9Bs2uF6ITYZWyVHPrtuoGuMXleZ/U3Ccq+kf0AzTvguShsFERZuQ6KfSgfH+cw/zQ9WxlDly05+oGpwxSzm/qi5AMRkJOtU0h6N8pM18HpS8EeRMDH/UP1rztXn05//hSl/YWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N9olpr5k; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N9olpr5k"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b239763eeddso2280899a12.1
        for <brcm80211@lists.linux.dev>; Mon, 12 May 2025 01:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747039613; x=1747644413; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kf5jY+bshJkTSqqXUeIcIwT+gNT7JYSdlSqQMkKH97s=;
        b=N9olpr5kushnbG5VUW5I4376jXMDQcEZT3y9Jyl29raCoqPXKtFAgxe+YlmpuH/kQ3
         5l/znb90uGzo39TxR+tu8w5XmpSJ4/Wxd6Tla9JqrlY1Q5oQhYh6KqINDZ7xHpYmxrhP
         Sy2Ntg7LHTQ0JbECjM/U6rU6725iO7rit+Jsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039613; x=1747644413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf5jY+bshJkTSqqXUeIcIwT+gNT7JYSdlSqQMkKH97s=;
        b=XzyZfctx0IwvXi7DXNhl16qMAzfeybklT1PBxfZ4AS8U/Er0bNo/Aag1Dv5mtemcmz
         xGfCbTcEjHoYeszJAvBhoKG4BclfgvO6sKDN4OvtDWcfumVHYknsZR2WudBrpvCC0aB8
         W0BN4HhMkerXH+iwcrZyiZ7zMc5K0mlNmwu32yR4iteiGGpy81qbxcxKUjgDwNPjR0C8
         pUaj9eo8X5l5wZLCZXwuxXNe+4rjCcA+CL10vHArMjO95xwsaAk+SoiQ+r8s9FqHfx24
         Es2TNtt5rNZFfkteoo36mOxJM52fa31G4FgG8ySsNAuNfGJHHoLBCqwRTqtj4KOXFFzr
         OPYA==
X-Forwarded-Encrypted: i=1; AJvYcCW2kYDtQT894yKaUnURj3QoUSEmzKbS7msww0xGug6CWRt82cjoPN7UgIwJR21GlD8iHVbkLvdZEC4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywo1Jq992RfmcQYG5/f/LotHf5+kLuRvD4tqkYxEYJGKU/yIRYK
	dXwCkwHmuuPoqBOWQJPU43pbisyZU+o0iyDJTHeV9Qw+JWSDA3zBO2tZj3dQOQ==
X-Gm-Gg: ASbGnctdp9Iq66b8gDRP8sde6YbE9+tis7Juj8vEpoWwwxyIGBNaLqymfV/mmVn5fvg
	MB8ZLUbVhWPleX+bhRIWYklYsDlyp4FOtHRw4OuqvMkvMhet2tLPnvGrZ2KSaTv9HeuXRj/3Cbo
	muLxxdYdVoPIKrKzlhnOVK0qh3LTf6bCjWUOoR0Dtc2H4xEjWiWJDjEM4qzptLAPKoFwel9yZtD
	tA1mpEHElNRLLREMXJpiudWZaMzOpJ4/+VMgUgq5kLlPEmFME6ag0+Kmx0anbc2pv2KMv2lJV+V
	dFaupPyznV9LC/jBx3Q+vgPRNdQ9QeIYFqq2W/qqpxctF1bTLClqR2PQdfdynjrdQ7llNUU4aPY
	kNA==
X-Google-Smtp-Source: AGHT+IHsL3I+2Pp+sbCiGZGkqZrJ0ZpnxAOVxnfMtFkGwnTNAsG8GvA0ge1KRDsoDPY/EoK+d5PvnA==
X-Received: by 2002:a17:903:1948:b0:227:eb61:34b8 with SMTP id d9443c01a7336-22fc8b60b7emr165590905ad.25.1747039613247;
        Mon, 12 May 2025 01:46:53 -0700 (PDT)
Received: from [10.176.2.126] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7540ca4sm58290335ad.52.2025.05.12.01.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 01:46:52 -0700 (PDT)
Message-ID: <0e6a29e2-e7e1-421a-9509-e3b321a8a993@broadcom.com>
Date: Mon, 12 May 2025 10:46:48 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: potential dereference of garbage pointer in brcmfmac USB driver
To: rtm@csail.mit.edu
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com
References: <74879.1746808907@localhost>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <74879.1746808907@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/2025 6:41 PM, rtm@csail.mit.edu wrote:
> A malicous USB device pretending to be a broadcom/brcm80211/brcmfmac
> wifi interface can generate a firmware signalling frame that causes
> brcmf_fws_hdrpull() to make skb->cb->reorder point into the frame
> data:
> 
>          signal_data = skb->data;
>          ...;
>                  data = signal_data + 2;
>                  ...;
>                  case BRCMF_FWS_TYPE_HOST_REORDER_RXPKTS:
>                          rd = (struct brcmf_skb_reorder_data *)skb->cb;
>                          rd->reorder = data;
> 
> Later on, brcmf_fws_rxreorder() pulls cur_idx out of the frame and
> uses it as an index without checking that it's in bounds (< rfi->maxIdx):
> 
>          reorder_data = ((struct brcmf_skb_reorder_data *)pkt->cb)->reorder;
>          ...;
>                  cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
>                  ...;
>                                  brcmu_pkt_buf_free_skb(rfi->pktslots[cur_idx]);
> 
> I've attached a usbip-based demo that generates a frame with this content:
> 
>       0x20    0x00    0x00    0x0d    0x00    0x00    0x0e   0x0e
>       0x00    0x00    0x00    0x00    0x04    0x00    0x80   0x00
> 
> The 0x80 causes cur_idx to be 128.
> 
> # uname -a
> Linux ubuntu66 6.15.0-rc5-00136-g9c69f8884904 #19 SMP PREEMPT_DYNAMIC Fri May  9 11:51:44 EDT 2025 x86_64 x86_64 x86_64 GNU/Linux
> # cc usbbc3b.c
> # ./a.out
> ...
>   Oops: general protection fault, probably for non-canonical address 0xcccccc00746e6572: 0000 [#1] SMP PTI
>   CPU: 4 UID: 0 PID: 4818 Comm: vhci_rx Tainted: G        W           6.15.0-rc5-00136-g9c69f8884904 #19 PREEMPT(voluntary)
>   Tainted: [W]=WARN
>   Hardware name: FreeBSD BHYVE/BHYVE, BIOS 14.0 10/17/2021
>   RIP: 0010:brcmu_pkt_buf_free_skb+0x9/0x30
>   Code: 00 00 00 48 89 d8 5b 5d c3 cc cc cc cc 0f 1f 40 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 48 85 ff 74 10 <48> 83 3f 00 75 0f be 02 00 00 00 e9 57 85 1f 00 c3 cc cc cc cc 90
>   RSP: 0018:ffffb3378075bd38 EFLAGS: 00010286
>   RAX: 0000000000000080 RBX: ffff9156068049c0 RCX: ffffb3378075bd00
>   RDX: ffffffffa8411808 RSI: ffffffffa7f44f90 RDI: cccccc00746e6572
>   RBP: ffffb3378075bdb0 R08: ffffffffa779c05b R09: ffff915602f7c8e0
>   R10: 0000000000000080 R11: 0000000000000004 R12: ffffb3378075bd60
>   R13: ffff9156025a9090 R14: 0000000000000080 R15: ffff915607cab840
>   FS:  0000000000000000(0000) GS:ffff9159869d6000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 00007fbd5f8e8210 CR3: 0000000102e42002 CR4: 00000000003706f0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>   Call Trace:
>    <TASK>
>    brcmf_fws_rxreorder+0x562/0x610
>    ? brcmf_rx_frame+0x8c/0x130
>    ? __pfx_brcmf_proto_bcdc_rxreorder+0x10/0x10
>    brcmf_rx_frame+0x8c/0x130
>    brcmf_usb_rx_complete+0xee/0x130
>    __usb_hcd_giveback_urb+0x8f/0x100
>    vhci_rx_loop+0x3fb/0x480
>    ? __pfx_vhci_rx_loop+0x10/0x10
>    kthread+0xf6/0x1f0
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork+0x2f/0x50
>    ? __pfx_kthread+0x10/0x10
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
>   Modules linked in:
>   ---[ end trace 0000000000000000 ]---
> 
> A gdb back-trace (on a different machine):
> 
> #0  brcmu_pkt_buf_free_skb (skb=0xa56b6b6b6b6b6b6b)
>      at drivers/net/wireless/broadcom/brcm80211/brcmutil/utils.c:34
> #1  0xffffffff809ea198 in brcmf_fws_rxreorder (ifp=<optimized out>,
>      pkt=0xffffffd602f58940)
>      at drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c:1751
> #2  0xffffffff809e809a in brcmf_proto_bcdc_rxreorder (ifp=<optimized out>,
>      skb=<optimized out>)
>      at drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcdc.c:403
> #3  0xffffffff809e309e in brcmf_proto_rxreorder (skb=0xffffffd602f58940,
>      ifp=<optimized out>)
>      at drivers/net/wireless/broadcom/brcm80211/brcmfmac/proto.h:114
> #4  brcmf_rx_frame (dev=<optimized out>, skb=skb@entry=0xffffffd602f58940,
>      handle_event=handle_event@entry=true, inirq=inirq@entry=true)
>      at drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c:510
> #5  0xffffffff809f5b2e in brcmf_usb_rx_complete (urb=0xffffffd6038041c0)
>      at drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c:528
> #6  0xffffffff80b3f292 in __usb_hcd_giveback_urb (
>      urb=urb@entry=0xffffffd6038041c0) at drivers/usb/core/hcd.c:1650
> #7  0xffffffff80b3f3d0 in usb_hcd_giveback_urb (
>      hcd=hcd@entry=0xffffffd603dbc000, urb=urb@entry=0xffffffd6038041c0,
>      status=<optimized out>) at drivers/usb/core/hcd.c:1734
> #8  0xffffffff80be9fa2 in vhci_recv_ret_submit (pdu=0xffffffc6002f3dd8,
>      vdev=0xffffffd603dbc2d0) at drivers/usb/usbip/vhci_rx.c:107

Hi Robert,

Thanks for notifying us about this issue. Will come up with a patch and 
give proper attribution for this.

Regards,
Arend
Regards,
Arend
