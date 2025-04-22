Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2B32900AB
	for <brcm80211@lists.linux.dev>; Tue, 22 Apr 2025 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745340753; cv=none; b=mUrR2AavwVCcbds24clgqQmoDpiDD5YIFZn4UsW0z3GTtC7nTdwXqEy7435jC6ipenAYLvzDtxM5bWpfCBusxp1bSbmPXnf/ClMLqkBInCRR+vEgk+J5gCDCx0cbQ0c0UpsFXDtdIuiNaZ5Kkad1OVJFOJBOU8cfIY8/5Oxy13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745340753; c=relaxed/simple;
	bh=aqfuT4KhozvPqTeyoEUgXQSOVYReVqP3zZDAZuJdN+Y=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=SRviz/grbkvESPU7RDevvmu2FXridX9P6tk6ts/HnDlREYaVYs5V5OsapOBUY+6fvKVlsb0lkq5leO0P1vFgeZjNCRwWaC8N4vRkS0OATqgBUdQoarWilNFSEyQSPkyvrdG2yiE+bZDk5XFwf22C27zaK+D9fxFJQFrLM5o7tGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClYYKALK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClYYKALK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso827343966b.1
        for <brcm80211@lists.linux.dev>; Tue, 22 Apr 2025 09:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745340750; x=1745945550; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+oAuAoMz4sDO/AVlpJFxLDfgAHNfCGXQoimCA6wbDjw=;
        b=ClYYKALKak9rVtLxjSGO3xGPdtXDkxwZLuTDq8NFO5zYaBmA493Z51MHD0Z3i8Qesh
         muQyEUKlgPIR1DNm59KzYo7fW2t/TooDrhLyHUEjsun4DuLQHQ7we88mV4j5V4sElOYl
         54fdAAkF4UDJIZgL76sQxHikS5DenHNzHerxwP+zpROZWVILsXcISpx9oqGA0DfYwGks
         vfgWA/Si0bHOKb9WvAOenZq+mINIUWcccebFCb4fmstZOWml7EuY4OXNKoTUo7XxW4nL
         1aJrrLFCkjaJAvWaHBwuj4K3WZgWMD1lxND2c3UgSgi3RVAS7drqOBajsLvrNtHv/V6h
         NFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745340750; x=1745945550;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+oAuAoMz4sDO/AVlpJFxLDfgAHNfCGXQoimCA6wbDjw=;
        b=wCE4jyRPnU0LGTsg6UxqnLo7UdbmPyhIlnYAlQx5/8jDuJvAeXrBfkkPw2TyX8BrhE
         +z0AyXhaOWks728T4oFJLVfANgEjXdru/1tsu0VKhNv3gdMmynrs1V1W1qdIhpkfEWw7
         82oL0Z2qBG9W/k6LNaNuMfLll0FPrwBMZQUjDLcEaUYG+ayqaaY6qzC4NaWA+BiV3a3D
         cqC8SmghN8wdaF9JXH1il8Hx1S//qwbpl1a9pbSTemFqt7huvsAaLAjvJgDJVNTwGnbU
         Eeo0u5zvTItXgfWz2JkKwPyqpuijrF6piBFgTA1mAT8RjAhmTxo3asc9cfWFEKvjCmgo
         ZhgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVY5Z5jUKcH2o4NgL3EQI7i4ZBuk+zKuFOybuNyD8JgJsSKxEmnMNxsB+40SwmwNpFRUK3KHZysLks=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzpy7v3yBDbj+KDPj6AHDt+0Y5TZjrQTQiNLNUVnAzUrmYV2bo6
	teOOXFF0Z/zbyGaAXxowtEv5a2gNkAnMJJQg3vXILLWr8PuWzZ/ZjyTIWDpuYZhWqmVutKv63n/
	MU3MOQQXJZNgSxVQVkVk50NWOjfA=
X-Gm-Gg: ASbGncuZTR44GZo2m5StfrcHiKHK9/qPzeS3HBqqaNxmyW4cnAlBGPAC3yLrCidJtki
	YYAv7tX2M7TYQQpqtrOby5bOHNk+8Pf1+aGwb2KuihnLCvqvWdi7x10rdjgFGsBd44ZRyi4j7nZ
	A0RVJtt0dqB5yc3ixwrOk6HVPBb0rjsywBbei/
X-Google-Smtp-Source: AGHT+IGjK87FTeUvbxRDMJp3Phzmv+Ss5LEopx3yEtdaEfC6V7gvoX6F8QTxmfGb1oXdbUgI8ofjONrBu5KXE4pRWQs=
X-Received: by 2002:a17:907:1c07:b0:ac6:e20f:fa48 with SMTP id
 a640c23a62f3a-acb74bdcde0mr1397216866b.33.1745340750026; Tue, 22 Apr 2025
 09:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Hank Barta <hbarta@gmail.com>
Date: Tue, 22 Apr 2025 11:52:17 -0500
X-Gm-Features: ATxdqUEbJ4WG8mLzFBhg00fim0dvh4GtG-PzrR4F4r3oVhZOFqzj7wc8YjZ8lRg
Message-ID: <CABTDG886JyTFu0dUWgZAT89Dmxjm78VNk0TXcgf=1yABBRN5XQ@mail.gmail.com>
Subject: Stack dump, Pi 4B, Debian Bookworm (not RpiOS)
To: arend.vanspriel@broadcom.com, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Good morning, I encountered the following while attempting to connect
to a WiFi AP using iwd. Another user on the Raspberry Pi IRC
(ukleinek) suggested I forward that to this group.

hbarta@olive:~/MkDocs/my-notes/docs/hosts/Raspberry-Pi/4/allegan$ cat
iwd.crash.txt
[565142.844103] NET: Registered PF_ALG protocol family
[565142.895121] alg: No test for hmac(md4) (hmac(md4-generic))
[565255.271588] ------------[ cut here ]------------
[565255.278557] memcpy: detected field-spanning write (size 72) of
single field "&mgmt_frame->u" at
drivers/net/wireless/broadcom/brcm80211/brcmfm
ac/p2p.c:1469 (size 26)
[565255.295948] WARNING: CPU: 1 PID: 1135280 at
drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c:1469
brcmf_p2p_notify_action_frame_rx+0x30c
/0x440 [brcmfmac]
[565255.312770] Modules linked in: ghash_generic ghash_ce gf128mul gcm
ccm algif_aead des_generic libdes ecb algif_skcipher md4 algif_hash
af_alg
nf_conntrack_netlink xt_nat veth xt_conntrack bridge stp llc xt_set
ip_set xt_addrtype xfrm_user xfrm_algo overlay xt_MASQUERADE xt_tcpudp
xt_mark
nft_compat nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 tun qrtr binfmt_misc hid_logitech_hidpp joydev hci_uart
btqca btrtl bt
bcm btintel btsdio bluetooth jitterentropy_rng sha512_generic evdev
bcm2835_v4l2(C) hid_logitech_dj sha512_arm64 bcm2835_mmal_vchiq(C)
videobuf2_v
malloc videobuf2_memops videobuf2_v4l2 cpufreq_dt videobuf2_common
videodev aes_neon_bs snd_bcm2835(C) mc aes_neon_blk vc4 zfs(POE)
snd_soc_hdmi_c
odec snd_soc_core raspberrypi_cpufreq drbg snd_pcm_dmaengine
ansi_cprng snd_pcm brcmfmac snd_timer zunicode(POE) brcmutil
ecdh_generic pwm_bcm2835
snd zzstd(OE) ecc nls_ascii zlua(OE) iproc_rng200 soundcore nls_cp437
cec bcm2835_wdt vfat fat rc_core bcm2711_thermal vchiq(C)
[565255.313189]  drm_display_helper v3d zcommon(POE) znvpair(POE)
hid_generic gpu_sched drm_dma_helper zavl(POE) drm_shmem_helper
drm_kms_helper i
cp(POE) leds_gpio spl(OE) sg cfg80211 rfkill nf_tables libcrc32c
nfnetlink loop fuse drm efi_pstore dm_mod dax configfs ip_tables
x_tables autofs4
usbhid hid ext4 crc16 mbcache jbd2 crc32c_generic sd_mod t10_pi
crc64_rocksoft crc64 crc_t10dif crct10dif_generic uas usb_storage
scsi_mod scsi_c
ommon xhci_pci dwc2 xhci_hcd broadcom udc_core bcm_phy_ptp bcm_phy_lib
reset_raspberrypi roles i2c_bcm2835 usbcore genet sdhci_iproc
mdio_bcm_unim
ac of_mdio usb_common fixed_phy fwnode_mdio crct10dif_ce
crct10dif_common sdhci_pltfm libphy fixed sdhci gpio_regulator
phy_generic
[565255.489912] CPU: 1 PID: 1135280 Comm: kworker/1:3 Tainted: P
  C OE      6.1.0-33-arm64 #1  Debian 6.1.133-1
[565255.489934] Hardware name: Raspberry Pi 4 Model B Rev 1.5 (DT)
[565255.489941] Workqueue: events brcmf_fweh_event_worker [brcmfmac]
[565255.490001] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[565255.490013] pc : brcmf_p2p_notify_action_frame_rx+0x30c/0x440 [brcmfmac]
[565255.490058] lr : brcmf_p2p_notify_action_frame_rx+0x30c/0x440 [brcmfmac]
[565255.490100] sp : ffff80000c8d3c20
[565255.490105] x29: ffff80000c8d3c20 x28: ffff145a4bc40810 x27:
0000000000000048
[565255.490123] x26: ffff145a7c9ed560 x25: 0000000000000048 x24:
ffff145a49cd8900
[565255.490139] x23: ffff145a07b6aa98 x22: 0000000000000058 x21:
ffff145a07b6aa80
[565255.490154] x20: ffff80000c8d3d78 x19: ffff145a48e139c0 x18:
0000000000000006
[565255.490169] x17: 010300080103060e x16: 0000000000000010 x15:
0000000000000001
[565255.490184] x14: 0000000020000000 x13: 0000000000000002 x12:
0000000000000000
[565255.490199] x11: 00000000ffffefff x10: ffffd291cf1109c8 x9 :
ffffd291cd61d33c
[565255.490214] x8 : 0000000000017fe8 x7 : c0000000ffffefff x6 :
0000000000000001
[565255.490229] x5 : ffff145a7fb74ad0 x4 : ffff145a7fb74ad0 x3 :
ffff145a7fb80c70
[565255.490243] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
ffff145a46768000
[565255.490258] Call trace:
[565255.490264]  brcmf_p2p_notify_action_frame_rx+0x30c/0x440 [brcmfmac]
[565255.490309]  brcmf_fweh_call_event_handler+0x44/0xc0 [brcmfmac]
[565255.490352]  brcmf_fweh_event_worker+0x190/0x490 [brcmfmac]
[565255.490395]  process_one_work+0x1f4/0x460
[565255.490416]  worker_thread+0x188/0x4e0
[565255.490429]  kthread+0xe0/0xe4
[565255.490441]  ret_from_fork+0x10/0x20
[565255.490455] ---[ end trace 0000000000000000 ]---
[565658.710117] ieee80211 phy0: brcmf_p2p_send_action_frame: Unknown
Frame: category 0x5, action 0x4
[565658.721227] IPv6: ADDRCONF(NETDEV_CHANGE): wlan0: link becomes ready
[565704.491659] ieee80211 phy0: brcmf_p2p_send_action_frame: Unknown
Frame: category 0x5, action 0x1
root@cheshire:/home/hbarta#

This was captured from dmesg output after I connected an Ethernet
cable because I experienced it while using the console.

I was running iwctl interactively and had entered (to the best of my
recollection) commands to scan (nothing reported) and list (reported
list of visible APs which seemed incomplete) and connect [AP Name].
The last command prompted for the pass phrasxe and when I entered it
and hit return, the stack dump appeared.

(Stack dumpo also at https://pastebin.com/CtEMNFxf for 6 months.)

The back story on this is that NetworkManager + wpa_supplicant is not
reliably maintaining a consistent connection so I am exploring other
configurations hoping to improve that.

best

Edit: I just enabled iwd (systemctl start iwd) and got another stack
dump on the console. I've added it to the pastebin.

-- 
Beautiful Sunny Winfield
