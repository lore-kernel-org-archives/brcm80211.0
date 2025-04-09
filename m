Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A8C2397B9
	for <brcm80211@lists.linux.dev>; Wed,  9 Apr 2025 12:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200671; cv=none; b=NaEA/46CjgLGcpXpF0CWPvJXaIrnd3Vt+sTpkwU71Srv7CWOeJ92caUre8MBtJJjQZPTvK2QWq9+upczrN5WzMtv+R+cmKZFuGRckEOWSW1n1mCSIw6Os2C7skXfNxfwyfvLL/cSsI8+hIHGKiern+rczxliI7liyf3SoeA8Yig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200671; c=relaxed/simple;
	bh=FjmBBQuTbqcSqV4VON5V19OosV8aeGF3vbwcOaR6PEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PSSoVeZleun9JK6MzD+hKP/23YlngVxMJqnnsdwt7mONXodXBfsUOIPpF2Dor2DtBlRSvzaEdF9SEuOQQ+A6Jb1wYwRcewD9rwfNaknCcpCic22eAf7dxh8MfmAMz2XvTkKu2Q8EMivKoleNg5IaS5m5012oeLQi/ichONM3n8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fkBPpjHI; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fkBPpjHI"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-727388e8f6cso3951598a34.0
        for <brcm80211@lists.linux.dev>; Wed, 09 Apr 2025 05:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1744200669; x=1744805469; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4PtXMGs7EWmz8YpnhCnXD5krrhFi7/XXZNLQxormo78=;
        b=fkBPpjHIrKDgDGTg7BSdWXeFxsqwYiSlSfbWcZ+yFZ3maclwIt3si781oLvFhm0AsV
         Dx54oR4taWw4XMpiXfUykW+P4IOQi9IUgDSFHCv+ELZ0IrJWZvmxMGLq6zjZVVJHxqm6
         iEjkitdgD/LQnsjfFNXDR5NdCC2T860MEm/2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744200669; x=1744805469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PtXMGs7EWmz8YpnhCnXD5krrhFi7/XXZNLQxormo78=;
        b=ncSbzbW83adE3YpNj90yJZuUKrAisZFHDDyu8kx1zBogwNRCC8fOvhCgyKeYUW0eZm
         yaZ4csC+eovbT1LetR3zpr1vmdL+CfwQVyuPCjUXDAqYwvxRrOmCjkm3dFqhOLMxX5KD
         OlubKT49h5XfiS78xoOjFFT4eIuhG3r1qpOaNksbyDLm7vxkhbiIBX5RhvlnTMtkfMnn
         etGPcP7zS7ym+KjieNSV/6e1pbpngcjjB+LgDPkrUJ2iR6U1hESdDDxaICLd5feMdrdS
         kXxmA7gt5+sYtWYsO26HisN+pr7vIAapkuDYofW0qUsEGPWaAtFKj0Fn1ZVXjaQmoZna
         r1TA==
X-Forwarded-Encrypted: i=1; AJvYcCW86+uhm/KArqKdcnkH/IIIvA2h7tDlroVtl2M+sDO9+KdMfOWvL/P8s2X8h8a4iYIVMDFeDf/mMVE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkbuVztyU7+vcbwq8fWvyyFw1Ze6o8F12zE5i6XiWfhmCRXLSq
	KBTL1SADDRVAHufFUHC6jLfNyLXh2Q4ByCPRjaGX06p3FCxSKx+VNsj7rucGyA==
X-Gm-Gg: ASbGncutRdbGRA4WNpKzyoop7lsoAKMp6az9LpxYrf58nIntk9Avbkb0/xvNIKKPnnw
	y1ttDW6+F+F3o8z30DPzYFVZ2Sou7YqzQ6KoWqYI9BbItXDeBCMYWSee1esF6Nzo7yvjLxMN1vh
	1H4ubuEGKsFy1iChGgYs2dFY9ISkhidKK3twAK/KLw7DE1ZK2sw8n3xtLX8OwcssEw27ouoE45H
	8BH5oYY+LbVnDx+c3nOZ9247lIt05pT9fV5kYAJTlcFrAYdI2qHZnYewxpFZuAwITkwr+2b/IdM
	l6fSm5pAM/SaMr0Y7cD0V838swyaIz25raaYEOhbxhSFZsv66S4t3/HQen9nLIbMY9kh+Ikga1o
	BpbU=
X-Google-Smtp-Source: AGHT+IFZAPvCBJgh9XVazfblCmGFa6YHh0C56/60XRWXvVZNJuVRhmhgazTESo+2pXIgjIbzPz1kxw==
X-Received: by 2002:a05:6830:6086:b0:72b:9506:8db6 with SMTP id 46e09a7af769-72e71aa22admr1193256a34.6.1744200669147;
        Wed, 09 Apr 2025 05:11:09 -0700 (PDT)
Received: from [10.176.68.145] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73e67465sm135366a34.57.2025.04.09.05.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 05:11:07 -0700 (PDT)
Message-ID: <d791185d-6a23-4c6f-8a93-d5464409939a@broadcom.com>
Date: Wed, 9 Apr 2025 14:11:02 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] brcm80211: fmac: Add error check for brcmf_usb_dlneeded()
To: Wentao Liang <vulab@iscas.ac.cn>, kvalo@kernel.org
Cc: christophe.jaillet@wanadoo.fr, megi@xff.cz, saikrishnag@marvell.com,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250406081930.2909-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Autocrypt: addr=arend.vanspriel@broadcom.com; keydata=
 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
In-Reply-To: <20250406081930.2909-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/6/2025 10:19 AM, Wentao Liang wrote:
> The function brcmf_usb_dlneeded() calls the function brcmf_usb_dl_cmd()
> but dose not check its return value. The 'id.chiprev' is uninitialized if
> the function brcmf_usb_dl_cmd() fails, and may propagate to
> 'devinfo->bus_pub.chiprev'.
> 
> Add error handling for brcmf_usb_dl_cmd() to return the function if the
> 'id.chiprev' is uninitialized.

Thanks for the patch, but NAK. Let me explain why below...

> Fixes: 71bb244ba2fd ("brcm80211: fmac: add USB support for bcm43235/6/8 chipsets")
> Cc: stable@vger.kernel.org # v3.4+
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>   drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index 2821c27f317e..50dddac8a2ab 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -790,6 +790,7 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>   {
>   	struct bootrom_id_le id;
>   	u32 chipid, chiprev;
> +	int err;
>   
>   	brcmf_dbg(USB, "Enter\n");
>   
> @@ -798,7 +799,11 @@ brcmf_usb_dlneeded(struct brcmf_usbdev_info *devinfo)
>   
>   	/* Check if firmware downloaded already by querying runtime ID */
>   	id.chip = cpu_to_le32(0xDEAD);
> -	brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> +	err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
> +	if (err) {
> +		brcmf_err("DL_GETID Failed\n");
> +		return false;

The boolean return value does not indicate pass or fail. It answers the 
question implied by the function name brcmf_usb_dlneeded(), ie. is the 
USB device running firmware (false) or do we need to download firmware 
(true). So returning false here is not going to help us.

The id.chip is initialized to 0xDEAD so upon a failure that value is 
being passed to brcmf_usb_prepare_fw_request() which will consequently 
return NULL, because we do not support a 0xDEAD chip. So there is no 
need to bail out here. Just print the failure message is enough although 
I would suggest to include the err value:

-	brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
+	err = brcmf_usb_dl_cmd(devinfo, DL_GETVER, &id, sizeof(id));
+	if (err)
+		brcmf_err("DL_GETVER failed: err=%d\n", err);

Regards,
Arend

