Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA3E29DB8D
	for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916939; cv=none; b=EGaT8HkcwdPBIJqU8PuwDLp2+pYLWNra7Ll9YJk+ZcMzp+9r5miLVKM7d7rhtX0YVtMXT57KwjxQbbH+qi50gGnj3R7rVL2oba0M/H/fzUKE3W3HXxig5qjfotpROAz9E7jsr0XQhxPK+8/g98CQc7Dbfy6uxyoplxnOLYt3dPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916939; c=relaxed/simple;
	bh=pAAdWk+lDB+lp9svoKoBUgncHf6I+M0m9Zt2UlIzMGs=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=c7CatjbcAkh2KnIdd9/xLRTr9vFassqqQbo9JeT4ZHg3vgAfOdlXyCoK1VsZa62XqP45n+tLqlBNAxOawSoO68YvPVPepD9Rk77f/J+QhyxFRFYsEC6/rOjsqP4BuTE/cnz0Nd4CwMLbdfKmMoCKA0q8MiY2VRVazSc2EOkZZ3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MSyJfEQ1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MSyJfEQ1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so1831996a12.0
        for <brcm80211@lists.linux.dev>; Tue, 29 Apr 2025 01:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745916936; x=1746521736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TW68MXGwEPbFsS4hScMhFkST84R6M8d9wEyh85F85p4=;
        b=MSyJfEQ198PuRVG/F82dhfeWWEke4wcydRAmHDsxyhMG+rsK7nZv5oLc8ZJyDWkrQu
         cYOzD0VP4m4jwhoEu+waKizvQFuhTphpB3c46qyk+tX/l/5kqi6gGSyoOBkZZ4ezGsBk
         knjO+J1SoGJe8CI9PfgNU+YYOiIA1bgDdnkbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916936; x=1746521736;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TW68MXGwEPbFsS4hScMhFkST84R6M8d9wEyh85F85p4=;
        b=NMpij1+UbPEc7g7PsuKRfcCTN6L7DJ/nvsZzWBYou0Qkp7Dq7TQW5rosQ+iqq6uBX2
         3l/PXPd+c0HizUk+FfVivw4BJ7nch7IBUFmxAqU3nM9NvQ+UUIuxpgLqAEKZOqy1z4Pj
         tJW1WmlZ+XXFQ47U9CjNmDDxzPuXytBAn2ZoTesp8pfpm7F2UXPS99mFoYhJnm7OUssN
         JZY+IQTLHWsj2VocJStf3QOv8uUO3mAyPvH6xRT6TmUD9i04P82RDDuyFvFgDEzvWrA8
         BGelms2rxWqXV5i+11/g/5Qhy0cPvI2k7s8t6fbluyO4UR4SW+3eT9pyOhwmtb0itZ90
         MHIA==
X-Forwarded-Encrypted: i=1; AJvYcCUes7xrtTKIN2LOXebNxNx+OckcUgHNy22MGD7irGlvoMebBGwQNwL1TpdyG+SmnhUNMN7QLfQ3crQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD8xmKzeIlocWbwaMEH/T+v0n3GapxcTyHZbMrhb+w/r+S3vGj
	Co5Y4AG9ul1kB4mUUCO+uLuN0ynxL9xvadPyW4mDWmNVSVVqN7W++WfpYYqDsw==
X-Gm-Gg: ASbGncutCTSwrY7x4t8XaXPl9RxV9w4iUq9HVp5YdyJ5OiePUaKCEyOuFrnyyIBESk6
	gvQnl6IPxd6HGEV/XIQr2KriVUe9Svb0jsFBaauqW28uQG6bilZbFVN1OxjSPS6Xjcd2paL8NmM
	qoRBF1FkM3OuuFE9QRuS+mDk34/ouMYKczMJhU4layanMfQC1I41n0n8uZ40bZAgF/UGiugW8by
	83MH6lnNnEUw45ozjRGJDy5Ic0fXJq0F7RAByC89xJJWbmqLlf9r+z2NuBBmVZSd6nZPEt2Zkk/
	y+oOmMAu5uwv9M6hdq0w0VFhsQYhuey5mrE9DLbxMfE/18fOn8vvOhwJxbwPIqfuQpXSYQDFDnX
	q/cc=
X-Google-Smtp-Source: AGHT+IHaYfCeH6nUR/6tAIZ9C/xYs2T+HxF+WLJBGle3a4ZVfTJZo/7fVNbO9mL1lQmBd4GJk0qHeQ==
X-Received: by 2002:a17:907:1ca2:b0:ac7:e366:1eab with SMTP id a640c23a62f3a-ace84af4e8emr1189806866b.48.1745916935717;
        Tue, 29 Apr 2025 01:55:35 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafec7sm744211766b.165.2025.04.29.01.55.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 01:55:35 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Peter Robinson <pbrobinson@gmail.com>
CC: Johannes Berg <johannes@sipsolutions.net>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>
Date: Tue, 29 Apr 2025 10:55:33 +0200
Message-ID: <19680c23388.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CALeDE9ONCUH0pQ4Yux=30Lim_SZMcbQsnWx0R+aPhF0E7tf9=g@mail.gmail.com>
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
 <CALeDE9MGXiSN=8E+T_ZGOLHsk8DB4iL=hV7ircqqb9=q1xTUYw@mail.gmail.com>
 <1967fbdeea0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CALeDE9ONCUH0pQ4Yux=30Lim_SZMcbQsnWx0R+aPhF0E7tf9=g@mail.gmail.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH wireless-next v3 0/4] wifi: brcmfmac: external auth support for Infineon devices
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 29, 2025 10:19:00 AM Peter Robinson <pbrobinson@gmail.com> wrote:

>>> I will try and find a couple of other devices with an appropriate
>>> cypress/infineon.
>>
>> Thanks for giving the patches a spin. The firmware should have a feature
>> named sae_ext. I think the one you with iw are indicating same support in
>> general.
>
> I am not so sure.
>
> RPi4 (BCM4345/6 - 7.45.234 (4ca95bb CY) FWID 01-996384e2)
>        Supported extended features:
>                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
>                * [ 4WAY_HANDSHAKE_STA_PSK ]: 4-way handshake with PSK
> in station mode
>                * [ 4WAY_HANDSHAKE_STA_1X ]: 4-way handshake with
> 802.1X in station mode
>                * [ DFS_OFFLOAD ]: DFS offload
>                * [ SAE_OFFLOAD ]: SAE offload support
>                * [ 4WAY_HANDSHAKE_AP_PSK ]: AP mode PSK offload support
>                * [ SAE_OFFLOAD_AP ]: AP mode SAE authentication offload support
>
> Jetson TX1 (BCM4354/1 - fw 7.35.349.104 (775a9ab CY) FWID 01-d55901b0):
>        Supported extended features:
>                * [ CQM_RSSI_LIST ]: multiple CQM_RSSI_THOLD records
>                * [ DFS_OFFLOAD ]: DFS offload
>
> So I have different brcmfmac HW reporting different features.
>
>> You can check the firmware features in debugfs under
>> <mount>/ieee80211/phyX/fwcap.
>
> I don't get fwcap on either of the above devices:
>
> ls /sys/kernel/debug/ieee80211/phy0/
> fragmentation_threshold  ht40allow_map  long_retry_limit
> rts_threshold  short_retry_limit

Ah, yes. My bad. They are only created if CONFIG_BRCMDBG is selected.

Regards,
Arend



