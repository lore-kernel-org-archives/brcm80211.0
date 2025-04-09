Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6B226B2CA
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 15:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744211044; cv=none; b=IRN7vDdVVbLZ3753YQQN3Ui9w67TYGRVEf0wfy8yINHS5q4FX8zgTY4vLKKjtW2ys39NMNe+7FDqktP2nlYYz0zf5KEYtq+L8FZpNZVsOJwQ5/UdGs1nIS/I9s3E7EqLzviM/p4M67OrnRolcEGpnAB9592CfHxKhWtQDqboP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744211044; c=relaxed/simple;
	bh=A70GfRt6rS7q055BdUvnvblK20cYmxXB3ubM9CYqwaE=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bR4NKNm1gpO5IX+M8Bwd1fH1BteFBPZL54Gjjl3OBb4LXN7cI4RyLO3Hw8GKMCQrJo3P+Pv6Lu6TdCi+n+GuLOXcWtHr7u5sIjp5kdqNKbUOgouLOjFCqlKT0mwNu1nvmIPWb/qa5JWM13xfSjBzAT7NfMZEaAzGovRCi0T3JPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FRe32eQ7; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FRe32eQ7"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aca99fc253bso206844966b.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 08:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744211041; x=1744815841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdQ6uVYA6aRCHZvQyDMxVKHgqhU7FXpMW3GkKnr+FVY=;
        b=FRe32eQ77xc4uLW75iy9zSsWM4sBQToeX4RuJJ6ECVAdaCB/QWbniLNSCScA5WEBS4
         UPdpDsXkY9b2k2Y6o65UOtVvaIbhPo5s9oxj+VFgXVQ8m5KKa7zbXmzV23QR4203GB5y
         RhQat5/xhDXyumBfUzL0BVQ9ZjcvgeCNh9Hvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744211041; x=1744815841;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdQ6uVYA6aRCHZvQyDMxVKHgqhU7FXpMW3GkKnr+FVY=;
        b=XYACRieRfZCfq2CRJlsZK53quh7a5at+pW+WPnPuuaVCSf8O/RIL1Qs4qUlhOzOqBC
         lQnH2HZGw1dA0Gbw/HtfbiVnMfLv/M2vZEfKP0IU0wPYIJDwmQ8lIlF/L1nGIv6lF9z3
         n4hC0dLDrEIXD2Tmbg5HcG88+Zv8jUYhZ4ayu1vx+w/KgdAaicIdaSBqMvmdbU09GxcZ
         CIedXM0HUz1zn3yHHaasKBZ8LmzCIl97FJXJ67TtwfvAeoj2LXXmvqDPBD2Ozqacs5mG
         EE1y0xkzyotwKfqHB+4FaNkWHHoQ4TFd821//j6QGwCLN9/fIxQ3m78I8+JRIGTU45Su
         Zz1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1oR68f+IZGFfkA6XNO7DtPolBK+BU1LHKf3YGxmL6+Sxdwl+6rALGiohFXwjBJ0+3zgXWUfDxOEg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFhRNj3iIYO6TC9PEOVplUuAwEhGhc4vSVr3LZHPu7CeXWc2Lx
	6RixLY3geQ2gBFIwFPc/k/HKISv0Ys6/5oOsd0mqmOGuKPAAKZqiQ3wjDv58cA==
X-Gm-Gg: ASbGncsjmP4KmKAy2RjXUehPtwVy63/J+8YHgWPW2Uh79qBm5X+Hg7XH9qwRFyyOpwK
	aWYQ5FgU4NeiPqnTD5g2wx+vZt3I3/vN6P/9JYyPjfYxBHJWVWhLU2aN5aDdbSTV+dGJClAYsH7
	yH0hIUlJhqwcCLTNfXDuxkY2Em8mJigRN8VZq9vMn7PWJnIdyPdNpLuwDdU8zEjliA0wWAkiE7q
	RFbQjSIyMBddBuze0RtLnB4rbyxRRa5zTfMdR0UzIFA6D5airXtd8zZeB0G7Oph/3sq/6Jz8ROr
	LRHmTIjTGDHDcCK4rq+B2BCLj5N+8PODLTlMMRpHHVQlw7F4w+ZtCTu1rWp4+t/Pck0t1yCuGfz
	pisg=
X-Google-Smtp-Source: AGHT+IH8rvSNSI9ZT7sJJpxIkBiqflzFJXcmfoY4w8kr3Fxm/euzzgm+d6qqs73HjSj0q7bCQs8BSw==
X-Received: by 2002:a17:907:97d4:b0:ac3:121e:f2cb with SMTP id a640c23a62f3a-aca9d5dd4femr248936966b.1.1744211040164;
        Wed, 09 Apr 2025 08:04:00 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7042sm106602666b.165.2025.04.09.08.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 08:03:59 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <christophe.jaillet@wanadoo.fr>, <megi@xff.cz>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Date: Wed, 09 Apr 2025 17:03:58 +0200
Message-ID: <1961b144f30.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <d791185d-6a23-4c6f-8a93-d5464409939a@broadcom.com>
References: <20250406081930.2909-1-vulab@iscas.ac.cn>
 <d791185d-6a23-4c6f-8a93-d5464409939a@broadcom.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] brcm80211: fmac: Add error check for brcmf_usb_dlneeded()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 9, 2025 2:11:08 PM Arend van Spriel <arend.vanspriel@broadcom.com> 
wrote:

> On 4/6/2025 10:19 AM, Wentao Liang wrote:
>> The function brcmf_usb_dlneeded() calls the function brcmf_usb_dl_cmd()
>> but dose not check its return value. The 'id.chiprev' is uninitialized if
>> the function brcmf_usb_dl_cmd() fails, and may propagate to
>> 'devinfo->bus_pub.chiprev'.
>>
>> Add error handling for brcmf_usb_dl_cmd() to return the function if the
>> 'id.chiprev' is uninitialized.
>
> Thanks for the patch, but NAK. Let me explain why below...
>
>> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 
>> chipsets")
>> Cc: stable@vger.kernel.org # v3.4+
>> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
>> ---
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 7 ++++++-
>> 1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> index 2821c27f317e..50dddac8a2ab 100644
>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
>> @@ -790,6 +790,7 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>> {
>> struct bootrom_id_le id;
>> u32 chipid, chiprev;
>> + int err;
>>
>> brcmf_dbg(USB, "Enter\n");
>>
>> @@ -798,7 +799,11 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>>
>> /* Check if firmware downloaded already by querying runtime ID */
>> id.chip = cpu_to_le32(0xDEAD);
>> - brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
>> + err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
>> + if (err) {
>> + brcmf_err("DL_GETID Failed\n");
>> + return false;
>
> The boolean return value does not indicate pass or fail. It answers the
> question implied by the function name brcmf_usb_dlneeded(), ie. is the
> USB device running firmware (false) or do we need to download firmware
> (true). So returning false here is not going to help us.
>
> The id.chip is initialized to 0xDEAD so upon a failure that value is
> being passed to brcmf_usb_prepare_fw_request() which will consequently
> return NULL, because we do not support a 0xDEAD chip. So there is no
> need to bail out here. Just print the failure message is enough although
> I would suggest to include the err value:
>
> - brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> + err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> + if (err)
> + brcmf_err("DL_GETVER failed: err=%d\n", err);

Maybe an error message in brcmf_usb_dl_cmd() would suffice printing the 
command id and error value. That way every invocation of the function logs 
a message upon failure.

Regards,
Arend
>


