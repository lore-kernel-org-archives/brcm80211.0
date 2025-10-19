Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234E81C84A2
	for <brcm80211@lists.linux.dev>; Sun, 19 Oct 2025 11:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760872785; cv=none; b=tZxMnTPHcaNiGPJIU4SAO2e/N2zBaeBeGIn5yMnHQHrhv7b5PUkyNFBJaynx3kvLGMpVH8j3ZyXWN/7cmH0yEaMzPCHIFdIRGafL6/LkIVamA4/ljrbTuJkG6+NrEnCtLW5ugBqAjtkkvLg1C4KpBgI4lBydPSr8NXldGwOLkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760872785; c=relaxed/simple;
	bh=tEkQp2sIfkQfzEDx03lu2c624oUqElD/6WOKBOub6o8=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=K0VpGqXJnCzF8X3mh2nFnbt8tPO8igeQQYp3VC/qYMv1fadzxcjPxCVh5dEvJLw8Dx43JO8B4RqzGntOCoWOgJMdmdwAht4XXmtx3A6MpfJJZ9mR7bsdgA8Safefc5EG1itjlqPUvVcelrNBKWXwn/3Mh8IA0LBJztcnRp8x50M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HUdOZzkN; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HUdOZzkN"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-27d3540a43fso36694685ad.3
        for <brcm80211@lists.linux.dev>; Sun, 19 Oct 2025 04:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760872783; x=1761477583;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TsB+tDEbHrQirUzM2BvJAhO/Udv9gdfHtlGbbHKvJc=;
        b=QIEYsh/1cGSdp1r572xvCSUq5vW1xTaOqoGqtQ+FKnZsw1J9eTnQf6rllQiq4dGbj3
         exQSkwi3FLpJAPH6ohidjwUeqkc912r6esxm9lmkG6aSc7b0xK4Mhz+wWkD7LYZxioOT
         cCxUhy8VJQ+xRW8vI4zyj5FivXnPHpeA6BBUagK478f8uGwbPTFAAPkkAajO0a5bkHAx
         EhYAztxsyKBMeezCMCC6GmTEuSKDQB/BywIZm3bD6+z0iVOBdg6olZlpUU/qp9cwGiQ4
         sqmEYhy/cn2V0xfY35oZFQG3fDH0l32OHEQ8hgo/sEqXOw9MjV2A7+5rE5icH/H1h24O
         eUHA==
X-Forwarded-Encrypted: i=1; AJvYcCVROEByTKeFycfsUXCciVaLcrvrLe2wW10Mw2uhGq/REMrfwp6JGlg9y7RUyviORlHv9zSUzl7Eo0s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQLMwPkkeFM6zIof9/RptQ6mrDc3Bp7Hz1nE1dvbyAGOc5WF9/
	/FQAD559oREL8vUpn0+RPwL0FNKos0/+nryAqUeKmcfcOJO+4zgzNx0juJtkTU2ihvg6jfmCHVO
	fKengNqSdPPR/drMdA1TtXblyaTbK0kVXElqKDupcWcyljJr9lk4ZO91NKPFs7xRZOrSHOvs85v
	Bigv2nvNQuat9C0+hXbVJsS+BUigoL5WnKeiQRm5KGmzgqDRTmpID2nJS8kSnZg5ES7LXf740Z1
	0GmbbPbz6FrS4RE/5BI8o7y
X-Gm-Gg: ASbGncs3tvumXZ7uKULq8uZqKrJKWtloU3uI4kYCxHhFqeJ+IrUMkYW2ZHyVm7DpyF4
	H3dVxuGO/RytuNwfdChCngQQFIPJ6toiQVlZa6ZRXiiSUvsSX05jCucgU6t9fWnowQODthYf7Rp
	T66/1pRPRIhMbo4/ERru2kHquQQuY990ewoZIEPWeVOVqfNY12C19n9FcI0hTP95h7g6umLBzZ+
	KGyuHJaHEM+66+NfiRwFCqBko8R5OO6DMhTUs1jY3tiv0Nlx1qUMFxvKJP/Z2+8feu7aH+8AsH0
	zRSRSFso9YUqJ4fUxy4wXMK6W91gKcYfNvaIhk2sgSzjJEyOzklmfezCCiEiSq/etSHN2UU/tr0
	TSpfoCUxab3Euc729YTaIR1aumFUUcGN8/W8z+EawLpFfZO4xeuf87hy2wj7Lq39dkye89KkmEx
	l1tm4JR9NzXITXQKbeHuqqez85b4BBpX2OjmuSbQ==
X-Google-Smtp-Source: AGHT+IHvTm+033BEiwR8hU9Z8Iwwtd/4jzuu1B7+SbtAvpBcVlgXf1+px8a3NzS2y6FcCFEbLnKPcek0bMYz
X-Received: by 2002:a17:902:e74a:b0:267:776b:a315 with SMTP id d9443c01a7336-290caf844ddmr118989775ad.32.1760872783257;
        Sun, 19 Oct 2025 04:19:43 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-19.dlp.protect.broadcom.com. [144.49.247.19])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-33d5de225aasm611980a91.4.2025.10.19.04.19.42
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 Oct 2025 04:19:43 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b58d1fe8cd7so486716566b.2
        for <brcm80211@lists.linux.dev>; Sun, 19 Oct 2025 04:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1760872781; x=1761477581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TsB+tDEbHrQirUzM2BvJAhO/Udv9gdfHtlGbbHKvJc=;
        b=HUdOZzkNNolKKop9t5+Z39tp3hfjBVy36hicT4n4BkMizb2TpJYcmkv3g4HUBgnpyK
         7qqSRr7H+Q/BnrSrV9JuFl2TF+uNU0KVEEOUIUCaGXjNxyx/apuTvY6BV4axOb13crRo
         UD5+3b8IJZhoZQOAS2o8fKytedgT/KMHi2dBI=
X-Forwarded-Encrypted: i=1; AJvYcCU2TicTNNgczP+OEZTN/0pLxmqq3bRqFsUkxyzOe7XDv7kd490mjjWgyKCCjPYM98J11vRuglCHSqs=@lists.linux.dev
X-Received: by 2002:a17:906:c14c:b0:b62:ac4e:c14f with SMTP id a640c23a62f3a-b6475012dd8mr1084721966b.54.1760872781370;
        Sun, 19 Oct 2025 04:19:41 -0700 (PDT)
X-Received: by 2002:a17:906:c14c:b0:b62:ac4e:c14f with SMTP id a640c23a62f3a-b6475012dd8mr1084720466b.54.1760872780874;
        Sun, 19 Oct 2025 04:19:40 -0700 (PDT)
Received: from [192.168.178.31] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8391523sm479130766b.18.2025.10.19.04.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 04:19:40 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Berkem Dincman <berkem.dincman@gmail.com>
CC: "linux-wireless" <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Sun, 19 Oct 2025 13:19:40 +0200
Message-ID: <199fc3250e0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAC3nzgJM6azT8T4StreR874h5sUarLH62mgHvRZndV_XEOBEgQ@mail.gmail.com>
References: <CAC3nzgJ9uX3rREGQGbLA+oJMzDh0Bc-Fs5sP1sM_4DGScgq=3w@mail.gmail.com>
 <977b67ef-ef6f-4ae4-99db-eeb921a17e3f@broadcom.com>
 <CAC3nzgJM6azT8T4StreR874h5sUarLH62mgHvRZndV_XEOBEgQ@mail.gmail.com>
User-Agent: AquaMail/1.55.2 (build: 105502562)
Subject: Re: New test release reload driver
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 19 oktober 2025 01:45:47 schreef Berkem Dincman <berkem.dincman@gmail.com>:

> This is dmesg the last lines after reloading the driver module

Better to respond inline and avoid top posting.

>
> 18 Eki 2025 Cmt 21:46 tarihinde Arend van Spriel <
> arend.vanspriel@broadcom.com> şunu yazdı:
>
>> On 10/18/2025 5:38 PM, Berkem Dincman wrote:
>>> I have PostmarketOS on Pinebook Pro v25.06 it has an 6.6.34 kernel
>>> originally I have custom kernels 6.16.7 6.17-rc7 also booting and wifi
>>> working 6.18-rc1 sends alot error messages to the screen but works fine
>>> if the driver (brcmfmac) is reloaded
>>
>> Thanks for the feedback. I would be happy to look into the 6.18-rc1
>> issue, but you are giving me much to work with. Any kernel logs that
>> show the error messages would be a start.

So the error messages indicate communication with the firmware on the wifi 
device is broken.

[ 20.068465] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
[ 20.069067] ieee80211 phy0: brcmf_cfg80211_get_channel: chanspec failed (-110)

But the firmware started ok because I see before the failures start to occur:

[ 16.137950] brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4345/6 wl0: Apr 
15 2021 03:03:20 version 7.45.234 (4ca95bb CY) FWID 01-996384e2

Things seem to go south when Bluetooth is starting:

[ 17.273314] Bluetooth: hci0: BCM4345C0 (003.001.025) build 0382
[ 17.287981] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[ 17.288011] Bluetooth: BNEP filters: protocol multicast
[ 17.288032] Bluetooth: BNEP socket layer initialized
[ 17.319081] Bluetooth: MGMT ver 1.23
[ 20.068465] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout

As Bluetooth resides on the same chip as wifi I find that suspicious. I 
would like to know what happens when you disable Bluetooth. Can you test that?

Regards,
Arend

>> Also please put the mailing lists in Cc: so other people seeing the same
>> issue can chime in.
>>
>> Regards,
>> Arend



